(use-modules (gnu)
	     (guix channels)
	     (guix inferior)
	     (guix profiles)
	     ;;for 'first'
	     (srfi srfi-1))
(use-service-modules desktop networking ssh xorg docker)

(define channels (list (channel (name 'nonguix) (url "https://gitlab.com/nonguix/nonguix"))
		       (channel (name 'guix) (url "https://git.savannah.gnu.org/git/guix.git"))))

(define inferior (inferior-for-channels channels))

(operating-system
  (locale "en_US.utf8")
  (timezone "America/Sao_Paulo")
  (keyboard-layout (keyboard-layout "us"))
  (host-name "guix")
  (users (cons* (user-account
                  (name "mmagueta")
                  (comment "MMagueta")
                  (group "users")
                  (home-directory "/home/mmagueta")
                  (supplementary-groups
                    '("wheel" "netdev" "audio" "video" "docker")))
                %base-user-accounts))
  
  (packages
    (append
      (list (specification->package "i3-wm")
            (specification->package "i3status")
            (specification->package "rofi")
            (specification->package "alacritty")
            (specification->package "emacs")
	    (specification->package "git")
	    (first (lookup-inferior-packages inferior "dotnet"))
	    (first (lookup-inferior-packages inferior "unrar"))
	    ;;(first (lookup-inferior-packages inferior "firefox"))
            (specification->package "ungoogled-chromium")
	    (specification->package "adwaita-icon-theme")
	    (specification->package "gnupg")
	    (specification->package "pinentry")
	    (specification->package "pinentry-efl")
	    (specification->package "pinentry-tty")
	    (specification->package "ranger")
	    (specification->package "sbcl")
            (specification->package "nss-certs"))
      %base-packages))
  (services
   (append
    (list (service openssh-service-type)
          (service docker-service-type)
          (service tor-service-type)
          (set-xorg-configuration
           (xorg-configuration
            (keyboard-layout keyboard-layout))))
    %desktop-services))
  (bootloader
   (bootloader-configuration
    (bootloader grub-efi-bootloader)
    (target "/boot/efi")
    (keyboard-layout keyboard-layout)))
  (mapped-devices
   (list (mapped-device
          (source
           (uuid "0d412e04-35f5-4324-92ae-4b62a83e57ce"))
          (target "cryptroot")
          (type luks-device-mapping))))
  (file-systems
   (cons* (file-system
           (mount-point "/boot/efi")
           (device (uuid "B5E7-443B" 'fat32))
           (type "vfat"))
          (file-system
           (mount-point "/")
           (device "/dev/mapper/cryptroot")
           (type "ext4")
           (dependencies mapped-devices))
          %base-file-systems)))
