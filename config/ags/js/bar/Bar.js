import Widget from 'resource:///com/github/Aylur/ags/widget.js';

import Clock from './components/Clock.js';

const Start = () => Widget.Box({
  className: 'start',
  children: [
  ],
});

const Center = () => Widget.Box({
  className: 'center',
  children: [
    Clock(),
  ],
});

const End = () => Widget.Box({
  className: 'end',
  halign: 'end',
  children: [
  ],
});

export default monitor => Widget.Window({
  name: `bar${monitor}`,

  monitor,
  exclusive: true,
  anchor: ['top', 'left', 'right'],

  child: Widget.CenterBox({
    className: 'panel',
    startWidget: Start(),
    centerWidget: Center(),
    endWidget: End(),
  }),
});
