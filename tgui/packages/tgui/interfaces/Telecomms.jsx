import {
  Box,
  Button,
  Flex,
  Input,
  LabeledControls,
  LabeledList,
  NoticeBox,
  NumberInput,
  Section,
  Table,
} from 'tgui-core/components';

import { useBackend } from '../backend';
import { Window } from '../layouts';

export const Telecomms = (props) => {
  const { act, data } = useBackend();
  const {
    channels,
    type,
    minfreq,
    maxfreq,
    frequency,
    multitool,
    multibuff,
    toggled,
    id,
    network,
    prefab,
    changefrequency,
    currfrequency,
    broadcasting,
    receiving,
    frequencyinfos,
  } = data;
  const linked = data.linked || [];
  const frequencies = data.frequencies || [];
  return (
    <Window title={id} width={400} height={600}>
      <Window.Content scrollable>
        {!multitool && <NoticeBox>Для внесения изменений используйте мультитул.</NoticeBox>}
        <Section title="Настройки">
          <LabeledList>
            <LabeledList.Item
              label="Питание"
              buttons={
                <Button
                  icon={toggled ? 'power-off' : 'times'}
                  content={toggled ? 'Вкл' : 'Выкл'}
                  color={toggled ? 'good' : 'bad'}
                  disabled={!multitool}
                  onClick={() => act('toggle')}
                />
              }
            />
            <LabeledList.Item
              label="Идентификатор"
              buttons={
                <Input
                  width={13}
                  value={id}
                  onBlur={(value) => act('id', { value })}
                />
              }
            />
            <LabeledList.Item
              label="Сеть"
              buttons={
                <Input
                  width={10}
                  value={network}
                  placeholder="tcommsat"
                  onBlur={(value) => act('network', { value })}
                />
              }
            />
            <LabeledList.Item
              label="Заводская сборка"
              buttons={
                <Button
                  icon={prefab ? 'check' : 'times'}
                  color={prefab ? 'good' : 'bad'}
                  content={prefab ? 'Да' : 'Нет'}
                  disabled
                />
              }
            />
          </LabeledList>
        </Section>
        {!!(toggled && multitool) && (
          <Box>
            {type === 'bus' && (
              <Section title="Bus">
                <Table>
                  <Table.Row>
                    <Table.Cell>Частота изменения:</Table.Cell>
                    <Table.Cell>
                      {channels.find(
                        (channel) => channel.freq === changefrequency,
                      ) && (
                        <Box
                          inline
                          color={
                            channels.find(
                              (channel) => channel.freq === changefrequency,
                            ).color
                          }
                          ml={2}
                        >
                          [
                          {
                            channels.find(
                              (channel) => channel.freq === changefrequency,
                            ).name
                          }
                          ]
                        </Box>
                      )}
                    </Table.Cell>
                    <NumberInput
                      animate
                      unit="kHz"
                      step={0.2}
                      stepPixelSize={10}
                      minValue={minfreq / 10}
                      maxValue={maxfreq / 10}
                      value={changefrequency / 10}
                      onChange={(value) => act('change_freq', { value })}
                    />
                    <Button
                      icon="times"
                      color="bad"
                      disabled={changefrequency === 0}
                      onClick={() => act('change_freq', { value: 10001 })}
                    />
                  </Table.Row>
                </Table>
              </Section>
            )}
            {type === 'relay' && (
              <Section title="Relay">
                <Button
                  content={'Прием'}
                  icon={receiving ? 'volume-up' : 'volume-mute'}
                  color={receiving ? '' : 'bad'}
                  onClick={() => act('receive')}
                />
                <Button
                  content={'Передача'}
                  icon={broadcasting ? 'microphone' : 'microphone-slash'}
                  color={broadcasting ? '' : 'bad'}
                  onClick={() => act('broadcast')}
                />
              </Section>
            )}
            <Section title="Связанные сетевые объекты">
              <Table>
                {linked.map((entry) => (
                  <Table.Row key={entry.id} className="candystripe">
                    <Table.Cell bold>
                      {entry.index}. {entry.id} ({entry.name})
                    </Table.Cell>
                    {!!multitool && (
                      <Button
                        icon="times"
                        color="bad"
                        disabled={!multitool}
                        onClick={() => act('unlink', { value: entry.index })}
                      />
                    )}
                  </Table.Row>
                ))}
              </Table>
            </Section>
            <Section title="Фильтрованные частоты">
              <Table>
                {frequencies.map((entry) => (
                  <Table.Row key={frequencies.i} className="candystripe">
                    <Table.Cell bold>{entry / 10} kHz</Table.Cell>
                    <Table.Cell>
                      {channels.find((channel) => channel.freq === entry) && (
                        <Box
                          inline
                          color={
                            channels.find((channel) => channel.freq === entry)
                              .color
                          }
                          ml={2}
                        >
                          [
                          {
                            channels.find((channel) => channel.freq === entry)
                              .name
                          }
                          ]
                        </Box>
                      )}
                    </Table.Cell>
                    <Table.Cell />
                    {!!multitool && (
                      <Button
                        icon="times"
                        color="bad"
                        disabled={!multitool}
                        onClick={() => act('delete', { value: entry })}
                      />
                    )}
                  </Table.Row>
                ))}
                {!!multitool && (
                  <Table.Row className="candystripe" collapsing>
                    <Table.Cell>Добавить частоту</Table.Cell>
                    <Table.Cell>
                      {channels.find(
                        (channel) => channel.freq === frequency,
                      ) && (
                        <Box
                          inline
                          color={
                            channels.find(
                              (channel) => channel.freq === frequency,
                            ).color
                          }
                          ml={2}
                        >
                          [
                          {
                            channels.find(
                              (channel) => channel.freq === frequency,
                            ).name
                          }
                          ]
                        </Box>
                      )}
                    </Table.Cell>
                    <Table.Cell>
                      <NumberInput
                        animate
                        unit="kHz"
                        step={0.2}
                        stepPixelSize={10}
                        minValue={minfreq / 10}
                        maxValue={maxfreq / 10}
                        value={frequency / 10}
                        onChange={(value) => act('tempfreq', { value })}
                      />
                    </Table.Cell>
                    <Button
                      icon={'plus'}
                      disabled={!multitool}
                      onClick={() => act('freq')}
                    />
                  </Table.Row>
                )}
              </Table>
            </Section>
            {type === 'server' && (
              <Section
                title="Настройки частот"
                buttons={
                  <Button
                    icon="plus"
                    color="good"
                    onClick={() => act('add_freq_info')}
                  />
                }
              >
                <Table>
                  {frequencyinfos.map((freq) => (
                    <Table.Row key={freq.frequency} className="candystripe">
                      <Flex justify="space-between" align="center">
                        <Flex.Item bold>{freq.frequency / 10} kHz</Flex.Item>
                        <Flex.Item>
                          <Box inline color={freq.color} ml={2}>
                            [{freq.name}]
                          </Box>
                        </Flex.Item>
                        <Flex.Item>
                          {!!multitool && (
                            <>
                              <Button
                                icon="wrench"
                                color="good"
                                disabled={!multitool}
                                onClick={() =>
                                  act('modify_freq_info', {
                                    freq: freq.frequency,
                                  })
                                }
                              />
                              <Button
                                icon="times"
                                color="bad"
                                disabled={!multitool}
                                onClick={() =>
                                  act('delete_freq_info', {
                                    freq: freq.frequency,
                                  })
                                }
                              />
                            </>
                          )}
                        </Flex.Item>
                      </Flex>
                    </Table.Row>
                  ))}
                </Table>
              </Section>
            )}
            {!!multitool && (
              <Section title="Мультитул">
                {!!multibuff && (
                  <Box bold m={1}>
                    Текущий буфер: {multibuff}
                  </Box>
                )}
                <LabeledControls m={1}>
                  <Button
                    icon={'plus'}
                    content={'Добавить машину'}
                    disabled={!multitool}
                    onClick={() => act('buffer')}
                  />
                  <Button
                    icon={'link'}
                    content={'Связать'}
                    disabled={!multibuff}
                    onClick={() => act('link')}
                  />
                  <Button
                    icon="times"
                    color="bad"
                    content={'Очистить'}
                    disabled={!multibuff}
                    onClick={() => act('flush')}
                  />
                </LabeledControls>
              </Section>
            )}
          </Box>
        )}
      </Window.Content>
    </Window>
  );
};
