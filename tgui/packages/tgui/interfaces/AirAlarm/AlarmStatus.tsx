import { LabeledList, Section } from 'tgui-core/components';

import { useBackend } from '../../backend';
import type { AirAlarmData } from './types';

const dangerMap = {
  0: {
    color: 'good',
    localStatusText: 'Оптимально',
  },
  1: {
    color: 'average',
    localStatusText: 'Осторожно',
  },
  2: {
    color: 'bad',
    localStatusText: 'Опасность (нужны баллоны)',
  },
} as const;

const faultMap = {
  0: {
    color: 'good',
    areaFaultText: 'Нет',
  },
  1: {
    color: 'purple',
    areaFaultText: 'Ручное срабатывание',
  },
  2: {
    color: 'average',
    areaFaultText: 'Автоматическое обнаружение',
  },
} as const;

export function AirAlarmStatus(props) {
  const { data } = useBackend<AirAlarmData>();
  const { envData } = data;

  const localStatus = dangerMap[data.dangerLevel] || dangerMap[0];
  const areaFault = faultMap[data.faultStatus] || faultMap[0];

  return (
    <Section title="Состояние атмосферы">
      <LabeledList>
        {envData.length <= 0 ? (
          <LabeledList.Item label="Предупреждение" color="bad">
            Не удалось получить пробу воздуха для анализа.
          </LabeledList.Item>
        ) : (
          <>
            {envData.map((entry) => {
              const status = dangerMap[entry.danger] || dangerMap[0];
              return (
                <LabeledList.Item
                  key={entry.name}
                  label={entry.name}
                  color={status.color}
                >
                  {entry.value}
                </LabeledList.Item>
              );
            })}
            <LabeledList.Item label="Локальный статус" color={localStatus.color}>
              {localStatus.localStatusText}
            </LabeledList.Item>
            <LabeledList.Item
              label="Статус зоны"
              color={data.atmosAlarm || data.fireAlarm ? 'bad' : 'good'}
            >
              {(data.atmosAlarm && 'Тревога атмосферы') ||
                (data.fireAlarm && 'Пожарная тревога') ||
                'Норма'}
            </LabeledList.Item>
            <LabeledList.Item label="Статус сбоя" color={areaFault.color}>
              {areaFault.areaFaultText}
            </LabeledList.Item>
            <LabeledList.Item
              label="Место сбоя"
              color={data.faultLocation ? 'blue' : 'good'}
            >
              {data.faultLocation || 'Нет'}
            </LabeledList.Item>
          </>
        )}
        {!!data.emagged && (
          <LabeledList.Item label="Предупреждение" color="bad">
            Меры безопасности отключены. Устройство может вести себя нестабильно.
          </LabeledList.Item>
        )}
      </LabeledList>
    </Section>
  );
}
