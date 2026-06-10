import { Box, Button, Icon, LabeledList, Section } from 'tgui-core/components';

import { useBackend } from '../backend';
import { Window } from '../layouts';

type AirlockControllerData = {
  airlockState: string;
  sensorPressure: number;
  pumpStatus: string;
  interiorStatus: string;
  exteriorStatus: string;
};

type AirlockStatus = {
  primary: string;
  icon: string;
  color: string;
};

export const AirlockController = (props) => {
  const { data } = useBackend<AirlockControllerData>();
  const { airlockState, pumpStatus, interiorStatus, exteriorStatus } = data;
  const currentStatus: AirlockStatus = getAirlockStatus(airlockState);
  const localizeStatus = (str: string) =>
    ({
      open: 'Открыта',
      closed: 'Закрыта',
      on: 'Включен',
      off: 'Отключен',
      siphon: 'Откачка',
      release: 'Выпуск',
    })[str] || str.replace(/^\w/, (c) => c.toUpperCase());

  return (
    <Window width={500} height={190}>
      <Window.Content>
        <Section title="Состояние шлюза" buttons={<AirLockButtons />}>
          <LabeledList>
            <LabeledList.Item label="Текущее состояние">
              {currentStatus.primary}
            </LabeledList.Item>
            <LabeledList.Item label="Давление в камере">
              <PressureIndicator currentStatus={currentStatus} />
            </LabeledList.Item>
            <LabeledList.Item label="Насос управления">
              {localizeStatus(pumpStatus)}
            </LabeledList.Item>
            <LabeledList.Item label="Внутренняя дверь">
              <Box color={interiorStatus === 'open' && 'good'}>
                {localizeStatus(interiorStatus)}
              </Box>
            </LabeledList.Item>
            <LabeledList.Item label="Внешняя дверь">
              <Box color={exteriorStatus === 'open' && 'good'}>
                {localizeStatus(exteriorStatus)}
              </Box>
            </LabeledList.Item>
          </LabeledList>
        </Section>
      </Window.Content>
    </Window>
  );
};

/** Displays the buttons on top of the window to cycle the airlock */
const AirLockButtons = (props) => {
  const { act, data } = useBackend<AirlockControllerData>();
  const { airlockState } = data;
  switch (airlockState) {
    case 'pressurize':
    case 'depressurize':
      return (
        <Button icon="stop-circle" onClick={() => act('abort')}>
          Прервать
        </Button>
      );
    case 'closed':
      return (
        <>
          <Button icon="lock-open" onClick={() => act('cycleInterior')}>
            Открыть внутренний шлюз
          </Button>
          <Button icon="lock-open" onClick={() => act('cycleExterior')}>
            Открыть внешний шлюз
          </Button>
        </>
      );
    case 'inopen':
      return (
        <>
          <Button icon="lock" onClick={() => act('cycleClosed')}>
            Закрыть внутренний шлюз
          </Button>
          <Button icon="sync" onClick={() => act('cycleExterior')}>
            Переключить на внешний шлюз
          </Button>
        </>
      );
    case 'outopen':
      return (
        <>
          <Button icon="lock" onClick={() => act('cycleClosed')}>
            Закрыть внешний шлюз
          </Button>
          <Button icon="sync" onClick={() => act('cycleInterior')}>
            Переключить на внутренний шлюз
          </Button>
        </>
      );
    default:
      return null;
  }
};

/** Displays the numeric pressure alongside an icon for the user */
const PressureIndicator = (props) => {
  const { data } = useBackend<AirlockControllerData>();
  const { sensorPressure } = data;
  const {
    currentStatus: { icon, color },
  } = props;
  const spin = icon === 'fan';

  return (
    <Box color={color}>
      {sensorPressure} kPa {icon && <Icon name={icon} spin={spin} />}
    </Box>
  );
};

/** Displays the current status as two text strings, depending on door state. */
const getAirlockStatus = (airlockState): AirlockStatus => {
  switch (airlockState) {
    case 'inopen':
      return {
        primary: 'Внутренний шлюз открыт',
        icon: '',
        color: 'good',
      };
    case 'pressurize':
      return {
        primary: 'Переключение на внутренний шлюз',
        icon: 'fan',
        color: 'average',
      };
    case 'closed':
      return {
        primary: 'Неактивен',
        icon: '',
        color: 'white',
      };
    case 'depressurize':
      return {
        primary: 'Переключение на внешний шлюз',
        icon: 'fan',
        color: 'average',
      };
    case 'outopen':
      return {
        primary: 'Внешний шлюз открыт',
        icon: 'exclamation-triangle',
        color: 'bad',
      };
    default:
      return {
        primary: 'Неизвестно',
        icon: '',
        color: 'average',
      };
  }
};
