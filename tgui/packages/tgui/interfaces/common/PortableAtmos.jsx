import {
  AnimatedNumber,
  Box,
  Button,
  LabeledList,
  Section,
} from 'tgui-core/components';

import { useBackend } from '../../backend';

export const PortableBasicInfo = (props) => {
  const { act, data } = useBackend();
  const {
    connected,
    holding,
    on,
    pressure,
    hasHypernobCrystal,
    reactionSuppressionEnabled,
  } = data;
  return (
    <>
      <Section
        title="Состояние"
        buttons={
          <Button
            icon={on ? 'power-off' : 'times'}
            content={on ? 'Вкл' : 'Выкл'}
            selected={on}
            onClick={() => act('power')}
          />
        }
      >
        <LabeledList>
          <LabeledList.Item label="Давление">
            <AnimatedNumber value={pressure} />
            {' kPa'}
          </LabeledList.Item>
          <LabeledList.Item label="Порт" color={connected ? 'good' : 'average'}>
            {connected ? 'Подключено' : 'Не подключено'}
          </LabeledList.Item>
          {!!hasHypernobCrystal && (
            <LabeledList.Item label="Подавление реакций">
              <Button
                icon={data.reactionSuppressionEnabled ? 'snowflake' : 'times'}
                content={
                  data.reactionSuppressionEnabled ? 'Включено' : 'Отключено'
                }
                selected={data.reactionSuppressionEnabled}
                onClick={() => act('reaction_suppression')}
              />
            </LabeledList.Item>
          )}
        </LabeledList>
      </Section>
      <Section
        title="Внутренний баллон"
        minHeight="82px"
        buttons={
          <Button
            icon="eject"
            content="Извлечь"
            disabled={!holding}
            onClick={() => act('eject')}
          />
        }
      >
        {holding ? (
          <LabeledList>
            <LabeledList.Item label="Метка">{holding.name}</LabeledList.Item>
            <LabeledList.Item label="Давление">
              <AnimatedNumber value={holding.pressure} />
              {' kPa'}
            </LabeledList.Item>
          </LabeledList>
        ) : (
          <Box color="average">Нет внутреннего баллона</Box>
        )}
      </Section>
    </>
  );
};
