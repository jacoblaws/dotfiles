import Bar from './js/bar/Bar.js'

export default {
  maxStreamVolume: 1.05,
  cacheNotificationActions: false,
  notificationPopupTimeout: 5000, // milliseconds

  closeWindowDelay: {
    'window-name': 500, // milliseconds
  },

  windows: [
    Bar(),
  ],
};
