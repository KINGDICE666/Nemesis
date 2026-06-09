import type { Dispatch, SetStateAction } from 'react';
import { useBackend } from 'tgui/backend';
import { Button, Stack } from 'tgui-core/components';

import type { AirAlarmData, AlarmScreen } from '../types';

type Props = {
  setScreen?: Dispatch<SetStateAction<AlarmScreen>>;
};

export function AirAlarmControlHome(props: Props) {
  const { act, data } = useBackend<AirAlarmData>();
  const { setScreen } = props;
  if (!setScreen) {
    throw new Error('setScreen is required');
  }

  const {
    allowLinkChange,
    atmosAlarm,
    filteringPath,
    panicSiphonPath,
    selectedModePath,
    sensor,
  } = data;

  const isPanicSiphoning = selectedModePath === panicSiphonPath;
  return (
    <Stack vertical>
      <Stack.Item>
        <Button
          icon={atmosAlarm ? 'exclamation-triangle' : 'exclamation'}
          color={atmosAlarm && 'caution'}
          onClick={() => act(atmosAlarm ? 'reset' : 'alarm')}
        >
          Тревога атмосферы зоны
        </Button>
      </Stack.Item>
      <Stack.Item mb={1}>
        <Button
          icon={isPanicSiphoning ? 'exclamation-triangle' : 'exclamation'}
          color={isPanicSiphoning && 'danger'}
          onClick={() =>
            act('mode', {
              mode: isPanicSiphoning ? filteringPath : panicSiphonPath,
            })
          }
        >
          Аварийная откачка
        </Button>
      </Stack.Item>
      <Stack.Item>
        <Button icon="sign-out-alt" onClick={() => setScreen('vents')}>
          Контроль вентиляции
        </Button>
      </Stack.Item>
      <Stack.Item>
        <Button icon="filter" onClick={() => setScreen('scrubbers')}>
          Контроль скрубберов
        </Button>
      </Stack.Item>
      <Stack.Item>
        <Button icon="cog" onClick={() => setScreen('modes')}>
          Режим работы
        </Button>
      </Stack.Item>
      <Stack.Item>
        <Button icon="chart-bar" onClick={() => setScreen('thresholds')}>
          Пороги тревоги
        </Button>
      </Stack.Item>
      {!!sensor && !!allowLinkChange && (
        <Stack.Item>
          <Button.Confirm
            icon="link-slash"
            color="danger"
            onClick={() => act('disconnect_sensor')}
          >
            Отключить сенсор
          </Button.Confirm>
        </Stack.Item>
      )}
    </Stack>
  );
}
