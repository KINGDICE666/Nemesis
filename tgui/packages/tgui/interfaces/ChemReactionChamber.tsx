import { useState } from 'react';
import {
  AnimatedNumber,
  Box,
  Button,
  LabeledList,
  NumberInput,
  RoundGauge,
  Section,
  Stack,
} from 'tgui-core/components';
import { round, toFixed } from 'tgui-core/math';

import { useBackend } from '../backend';
import { Window } from '../layouts';
import type { MixingData, Reagent } from './ChemMixingChamber';

type ReactingData = MixingData & {
  ph: number;
  reagentAcidic: number;
  reagentAlkaline: number;
  catalysts: Reagent[];
};

export const ChemReactionChamber = (props) => {
  const { act, data } = useBackend<ReactingData>();

  const [reagentQuantity, setReagentQuantity] = useState(1);

  const {
    emptying,
    temperature,
    ph,
    targetTemp,
    isReacting,
    reagentAcidic,
    reagentAlkaline,
  } = data;
  const reagents = data.reagents || [];
  const catalysts = data.catalysts || [];
  return (
    <Window width={290} height={570}>
      <Window.Content>
        <Stack vertical fill>
          <Stack.Item>
            <Section
              title="Условия"
              buttons={
                <Stack>
                  <Stack.Item mt={0.3}>{'Цель:'}</Stack.Item>
                  <Stack.Item>
                    <NumberInput
                      tickWhileDragging
                      width="65px"
                      unit="K"
                      step={10}
                      stepPixelSize={3}
                      value={round(targetTemp, 0.1)}
                      minValue={0}
                      maxValue={1000}
                      onChange={(value) =>
                        act('temperature', {
                          target: value,
                        })
                      }
                    />
                  </Stack.Item>
                </Stack>
              }
            >
              <Stack vertical>
                <Stack.Item>
                  <Stack fill>
                    <Stack.Item textColor="label">
                      Текущая температура:
                    </Stack.Item>
                    <Stack.Item grow>
                      <AnimatedNumber
                        value={temperature}
                        format={(value) => `${toFixed(value)} K`}
                      />
                    </Stack.Item>
                    <Stack.Item grow>
                      <RoundGauge
                        value={ph}
                        minValue={0}
                        maxValue={14}
                        format={() => ''}
                        position="absolute"
                        size={1.5}
                        top={0.5}
                        right={0.5}
                        ranges={{
                          red: [-0.22, 1.5],
                          orange: [1.5, 3],
                          yellow: [3, 4.5],
                          olive: [4.5, 5],
                          good: [5, 6],
                          green: [6, 8.5],
                          teal: [8.5, 9.5],
                          blue: [9.5, 11],
                          purple: [11, 12.5],
                          violet: [12.5, 14],
                        }}
                      />
                    </Stack.Item>
                  </Stack>
                </Stack.Item>
                <Stack.Item>
                  <Stack fill>
                    <Stack.Item textColor="label">{'ph:'}</Stack.Item>
                    <Stack.Item grow={15}>{ph}</Stack.Item>
                    <Stack.Item grow mt={1} mb={-0.5}>
                      <Button
                        color="transparent"
                        icon="question"
                        tooltip={`
                        В химии pH — это шкала кислотности или щёлочности
                        водного раствора. Кислые растворы имеют более низкий
                        pH, чем основные или щёлочные. Шкала pH логарифмическая
                        и обратно показывает концентрацию ионов водорода
                        в растворе.`}
                        tooltipPosition="bottom-start"
                      />
                    </Stack.Item>
                  </Stack>
                </Stack.Item>
              </Stack>
            </Section>
          </Stack.Item>
          <Stack.Item grow>
            <Section
              title="Настройки"
              fill
              scrollable
              buttons={
                (isReacting && (
                  <Box inline bold color={'purple'}>
                    {'Реакция'}
                  </Box>
                )) || (
                  <Box
                    fontSize="16px"
                    inline
                    bold
                    color={emptying ? 'bad' : 'good'}
                  >
                    {emptying ? 'Опустошение' : 'Наполнение'}
                  </Box>
                )
              }
            >
              <Stack vertical fill>
                <Stack.Item>
                  <LabeledList>
                    <LabeledList.Item label="Кислотный предел pH">
                      <NumberInput
                        tickWhileDragging
                        value={reagentAcidic}
                        minValue={0}
                        maxValue={14}
                        step={1}
                        stepPixelSize={3}
                        width="39px"
                        onChange={(value) =>
                          act('acidic', {
                            target: value,
                          })
                        }
                      />
                    </LabeledList.Item>
                    <LabeledList.Item label="Щелочной предел pH">
                      <NumberInput
                        tickWhileDragging
                        value={reagentAlkaline}
                        minValue={0}
                        maxValue={14}
                        step={1}
                        stepPixelSize={3}
                        width="39px"
                        onChange={(value) =>
                          act('alkaline', {
                            target: value,
                          })
                        }
                      />
                      <Box inline mr={1} />
                    </LabeledList.Item>
                  </LabeledList>
                </Stack.Item>
                <Stack.Item>
                  <Stack fill>
                    <Stack.Item grow>
                      <Button
                        color="good"
                        icon="plus"
                        onClick={() =>
                          act('add', {
                            amount: reagentQuantity,
                          })
                        }
                      >
                        Добавить реагент
                      </Button>
                    </Stack.Item>
                    <Stack.Item>
                      <NumberInput
                        tickWhileDragging
                        value={reagentQuantity}
                        minValue={1}
                        maxValue={100}
                        step={1}
                        stepPixelSize={3}
                        width="39px"
                        onChange={(value) => setReagentQuantity(value)}
                      />
                      <Box inline mr={1} />
                    </Stack.Item>
                  </Stack>
                </Stack.Item>
                <Stack.Item>
                  <Stack vertical>
                    {reagents.map((reagent) => (
                      <Stack.Item key={reagent.name}>
                        <Stack fill>
                          <Stack.Item mt={0.25} textColor="label">
                            {`${reagent.name}:`}
                          </Stack.Item>
                          <Stack.Item mt={0.25} grow>
                            {reagent.volume}
                          </Stack.Item>

                          <Stack.Item>
                            <Button
                              color="transparent"
                              tooltip={`
                                Эта кнопка превращает запись реагента в катализатор.
                                Реагенты-катализаторы не удаляются из реакционной камеры
                                после завершения. Полезно для некоторых реакций.`}
                              tooltipPosition="bottom-start"
                              onClick={() =>
                                act('catalyst', {
                                  chem: reagent.name,
                                })
                              }
                            >
                              C
                            </Button>
                          </Stack.Item>
                          <Stack.Item>
                            <Button
                              icon="minus"
                              color="bad"
                              onClick={() =>
                                act('remove', {
                                  chem: reagent.name,
                                })
                              }
                            />
                          </Stack.Item>
                        </Stack>
                      </Stack.Item>
                    ))}
                  </Stack>
                </Stack.Item>
              </Stack>
            </Section>
          </Stack.Item>
          <Stack.Item grow={0.7}>
            <Section title="Катализаторы" fill scrollable>
              <Stack.Item>
                <Stack vertical fill>
                  {catalysts.map((reagent) => (
                    <Stack.Item key={reagent.name}>
                      <Stack fill>
                        <Stack.Item mt={0.25} textColor="label">
                          {`${reagent.name}:`}
                        </Stack.Item>
                        <Stack.Item mt={0.25} grow>
                          {reagent.volume}
                        </Stack.Item>
                        <Stack.Item>
                          <Button
                            color="bad"
                            onClick={() =>
                              act('catremove', {
                                chem: reagent.name,
                              })
                            }
                          >
                            C
                          </Button>
                        </Stack.Item>
                      </Stack>
                    </Stack.Item>
                  ))}
                </Stack>
              </Stack.Item>
            </Section>
          </Stack.Item>
        </Stack>
      </Window.Content>
    </Window>
  );
};
