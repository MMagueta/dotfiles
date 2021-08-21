;; This is an operating system configuration generated
;; by the graphical installer.

(use-modules
 (gnu)
 (guix inferior)
 (srfi srfi-1)
 (guix channels)
 (gnu packages docker))
(use-service-modules desktop networking ssh xorg docker)

(operating-system
   (kernel
    (let*
      ((channels
        (list (channel
               (name 'nonguix)
               (url "https://gitlab.com/nonguix/nonguix")
               (commit "ff6ca98099c7c90e64256236a49ab21fa96fe11e"))
              (channel
               (name 'guix)
               (url "https://git.savannah.gnu.org/git/guix.git")
               (commit "3be96aa9d93ea760e2d965cb3ef03540f01a0a22"))))
       (inferior
        (inferior-for-channels channels)))
      (first (lookup-inferior-packages inferior "linux" "5.4.21"))))
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
      (list (specification->package "nss-certs") sbcl emacs mu)
      %base-packages))
  (services
    (append
      (list (service gnome-desktop-service-type)
            (service openssh-service-type)
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
              (uuid "bd954a1c-6045-4d1e-abe7-92aa51a94874"))
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
           %base-file-systems))


  (hosts-file (local-file "/home/mmagueta/.config/guix/configs/hosts")))
