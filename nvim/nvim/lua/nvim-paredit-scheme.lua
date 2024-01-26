local traversal = require("nvim-paredit.utils.traversal")
-- local common = require("nvim-paredit.utils.common")

-- THIS IS A REFERENCE, UNUSED
local nodes = {
  "comment",
  "block_comment", -- for example, #| something |#
  "directive", -- for example, #!r6rs
  "boolean",
  "character",
  "string",
  "escape_sequence", -- escape sequence in string, for example, \n in "abc\n"
  "number",
  "symbol", -- identifier
  "keyword", -- #:identifier
  "list", -- things surrounded by () or [] or {}
  "quote", -- '
  "quasiquote", -- `
  "syntax", -- #'
  "quasisyntax", --`
  "unquote", -- ,
  "unquote_splicing", -- ,@
  "unsyntax", -- #,
  "unsyntax_splicing", -- #,@
  "vector",
  "byte_vector",
 }

local forms = {
  comment = {2, 0},        -- for srfi 62,  #;
  block_comment = {2, 2},  -- for example, #| something |#
  string = {1, 1},
  list = {1, 1},           -- things surrounded by () or [] or {}
  vector = {2, 1},         -- #(...)
  byte_vector = {5, 1},    -- #vu8(...)
  vector = {2, 1},
 }


local function find_next_parent_form(current_node)
    if forms[current_node:type()] then
        return current_node
    end

    local parent = current_node:parent()
    if parent then
        return find_next_parent_form(parent)
    end

    return current_node
end

local function find_parent_comment(node)
    if node:type() == "comment" then
        return node
    end
    local parent = node:parent()

    if parent then
        return find_parent_comment(parent)
    else
        return nil
    end
end

local M = {}

-- Should return the 'root' of the given Treesitter node. For example:
-- The node at cursor in the below example is `()` or 'list_lit':
--   '(|)
-- But the node root is `'()` or 'quoting_lit'
M.get_node_root = function(node)
    local search_point = node
    if M.node_is_form(node) then
        search_point = node:parent()
    end

    local root = find_next_parent_form(search_point)
    return traversal.find_root_element_relative_to(root, node)
end
-- This is the inverse of `get_node_root` for forms and should find the inner
-- node for which the forms elements are direct children.
--
-- For example given the node `'()` or 'quoting_lit', this function should
-- return `()` or 'list_lit'.
M.unwrap_form = function(node)
    if forms[node:type()] then
        return node
    end
    local child = node:named_child(0)
    if child then
        return M.unwrap_form(child)
    end
end
-- Accepts a Treesitter node and should return true or false depending on
-- whether the given node can be considered a 'form'
M.node_is_form = function(node)
    if M.unwrap_form(node) then
        return true
    else
        return false
    end
end
  -- Accepts a Treesitter node and should return true or false depending on
  -- whether the given node can be considered a 'comment'
M.node_is_comment = function(node)
    return (find_parent_comment(node)
        or node:type() == "comment"
        or node:type() == "block_comment")
end
  -- Accepts a Treesitter node representing a form and should return the
  -- 'edges' of the node. This includes the node text and the range covered by
  -- the node
M.get_form_edges = function(node)
  local node_range = { node:range() }

  local form = M.unwrap_form(node)
  local form_range = { form:range() }

  -- Get the size of the form boundaries
  local size = forms[node:type()]
  if not size then
      -- default to {1, 1}
      size = {1, 1}
  end
  -- If it's an inline comment don't do anything
  if node:type() == "comment"
      and vim.api.nvim_buf_get_text(0, form_range[1], form_range[2],
        form_range[3], form_range[4], {})[1]:sub(1,1) == ";"
    then
      return {}
  end

  local left_range = { node_range[1], node_range[2] }
  left_range[3] = form_range[1]
  left_range[4] = form_range[2] + size[1]

  local right_range = { form:range() }
  right_range[1] = right_range[3]
  right_range[2] = right_range[4] - size[2]

  local left_text = vim.api.nvim_buf_get_text(0, left_range[1], left_range[2],
                          left_range[3], left_range[4], {})
  local right_text = vim.api.nvim_buf_get_text(0, right_range[1],
                          right_range[2], right_range[3], right_range[4], {})

  return {
      left = {
          text = left_text[1],
          range = left_range,
      },
      right = {
          text = right_text[1],
          range = right_range,
      },
  }
end

return M
