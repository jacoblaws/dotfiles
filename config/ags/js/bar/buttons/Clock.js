import { Widget, Utils } from '../../imports.js';

export default () => Widget.Label({
  className: 'clock',

  connections: [
    [
      1000, self => Utils.execAsync(['date', '+%H:%M - %b. %e'])
      .then(date => self.label = date).catch(console.error)
    ],
  ],
});
