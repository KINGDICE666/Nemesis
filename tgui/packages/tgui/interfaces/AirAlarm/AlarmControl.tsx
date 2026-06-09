import { useState } from 'react';
import { Button, Section } from 'tgui-core/components';

import { AirAlarmControlHome } from './screens/Home';
import { AirAlarmControlModes } from './screens/Modes';
import { AirAlarmControlScrubbers } from './screens/Scrubbers';
import { AirAlarmControlThresholds } from './screens/Thresholds';
import { AirAlarmControlVents } from './screens/Vents';
import type { AlarmScreen } from './types';

export const AIR_ALARM_ROUTES = {
  home: {
    title: 'Контроль атмосферы',
    component: AirAlarmControlHome,
  },
  vents: {
    title: 'Контроль вентиляции',
    component: AirAlarmControlVents,
  },
  scrubbers: {
    title: 'Контроль скрубберов',
    component: AirAlarmControlScrubbers,
  },
  modes: {
    title: 'Режим работы',
    component: AirAlarmControlModes,
  },
  thresholds: {
    title: 'Пороги тревоги',
    component: AirAlarmControlThresholds,
  },
} as const;

export function AirAlarmControl(props) {
  const [screen, setScreen] = useState<AlarmScreen>('home');

  const route = AIR_ALARM_ROUTES[screen] || AIR_ALARM_ROUTES.home;
  const Component = route.component;
  const isHome = route.title === AIR_ALARM_ROUTES.home.title;

  return (
    <Section
      fill
      scrollable
      title={route.title}
      buttons={
        <Button
          icon="arrow-left"
          onClick={() => setScreen('home')}
          disabled={isHome}
        >
          Назад
        </Button>
      }
    >
      <Component {...(isHome && { setScreen })} />
    </Section>
  );
}
