(define redshift
  (make <service>
    #:provides '(redshift)
    #:docstring "Redshift adjusts the color temperature of your screen
   according to your surroundings. This may help your eyes hurt less if you are
   working in front of the screen at night."
    #:start (make-forkexec-constructor '("redshift")
              #:log-file (string-append
                           (or (getenv "XDG_CONFIG_HOME")
                               (string-append (getenv "HOME") "/.config"))
                           "/redshift/redshift.log"))
    #:stop (make-kill-destructor)
    #:respawn? #t))
(register-services redshift)

(start redshift)
