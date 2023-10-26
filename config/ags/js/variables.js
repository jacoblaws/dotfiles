import { GLib } from './imports.js';

export const distro = GLib.get_os_info('ID');

export const distroIcon = (() => {
  switch(distro) {
    case 'arch': return '';
    case 'nixos': return '';
    case 'debian': return '';
    case 'ubuntu': return '';
    case 'fedora': return '';
    case 'endeavouros': return '';
    case 'opensuse-tumbleweed': return '';
    default: return '';
  };
})();
