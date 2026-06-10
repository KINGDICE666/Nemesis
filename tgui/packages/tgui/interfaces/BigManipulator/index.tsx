import { useEffect, useState } from 'react';
import {
  BlockQuote,
  Box,
  Button,
  Dropdown,
  Icon,
  Modal,
  Section,
  Slider,
  Stack,
  Table,
} from 'tgui-core/components';
import type { BooleanLike } from 'tgui-core/react';

import { useBackend } from '../../backend';
import { Window } from '../../layouts';
import type { ManipulatorData, ManipulatorTask } from './types';

const TASK_TYPE_LABELS: Record<string, string> = {
  pickup: 'Подобрать...',
  drop: 'Положить...',
  throw: 'Бросить...',
  use: 'Использовать в руке...',
  interact: 'Взаимодействовать...',
  wait: 'Ждать...',
};

const TASK_TYPE_ICONS: Record<string, string> = {
  pickup: 'hand',
  drop: 'box-open',
  interact: 'bolt',
  wait: 'hourglass-half',
};

const TASKING_STRATEGY_ICONS: Record<string, string> = {
  Sequential: 'list-ol',
  'Strict order': 'lock',
};

const TASKING_STRATEGY_LABELS: Record<string, string> = {
  Sequential: 'По порядку',
  'Strict order': 'Строгий порядок',
};

const VALUE_LABELS: Record<string, string> = {
  ALLOW: 'Разрешить',
  'TO FILTERS': 'К фильтрам',
  'TO HELD': 'К удерживаемому',
  FORBID: 'Запретить',
  'AT DROPOFF': 'У точки выгрузки',
  'AT MACHINE': 'У машины',
  'AT ANY FITTING': 'У любой подходящей',
  CONTINUE: 'Продолжать',
  'Always Pick Up': 'Подбирать всегда',
  'Wait For Suiting': 'Ждать подходящего',
  'SINGLE TIME': 'Один раз',
  'EMPTY HAND': 'Пустая рука',
  NORMAL: 'Обычное',
  DROP: 'Положить',
  THROW: 'Бросить',
  USE: 'Использовать',
  INTERACT: 'Взаимодействовать',
  'DROP ON FLOOR': 'Положить на пол',
  'DROP IN STORAGE': 'Положить в хранилище',
  'USE ON LIVING': 'Использовать на живом',
  'USE ON STRUCTURE': 'Использовать на структуре',
  'USE ON MACHINERY': 'Использовать на машине',
  'USE ON ITEM': 'Использовать на предмете',
  'USE ON VEHICLES': 'Использовать на транспорте',
};

const getValueLabel = (value?: string | null) =>
  value ? (VALUE_LABELS[value.toUpperCase()] ?? VALUE_LABELS[value] ?? value) : '—';

const buttonNumberToIcon: Record<number, string> = {
  1: '',
  2: 'arrow-up',
  3: '',
  4: 'arrow-left',
  5: 'arrows-to-dot',
  6: 'arrow-right',
  7: '',
  8: 'arrow-down',
  9: '',
};

function MasterControls() {
  const { act, data } = useBackend<ManipulatorData>();
  const { speed_multiplier, min_speed_multiplier, max_speed_multiplier } = data;

  return (
    <Stack>
      <Stack.Item>
        <Button
          icon="backward-step"
          onClick={() =>
            act('adjust_interaction_speed', { new_speed: min_speed_multiplier })
          }
        />
      </Stack.Item>
      <Stack.Item grow>
        <Slider
          style={{ marginTop: '-0px', marginBottom: '-7px' }}
          lineHeight={1}
          step={0.1}
          my={1}
          value={speed_multiplier}
          minValue={min_speed_multiplier}
          maxValue={max_speed_multiplier}
          unit="x"
          stepPixelSize={20}
          onChange={(_e, value) =>
            act('adjust_interaction_speed', { new_speed: value })
          }
        />
      </Stack.Item>
      <Stack.Item>
        <Button
          icon="forward-step"
          onClick={() =>
            act('adjust_interaction_speed', { new_speed: max_speed_multiplier })
          }
        />
      </Stack.Item>
      <Stack.Item>
        <Button
          icon="eject"
          tooltip="Разжать захваты и уронить удерживаемый предмет"
          onClick={() => act('drop_held_atom')}
        >
          Бросить
        </Button>
      </Stack.Item>
      <Stack.Item>
        <Button
          icon="person-walking-arrow-right"
          tooltip="Отстегнуть работника"
          onClick={() => act('unbuckle')}
        >
          Отстегнуть
        </Button>
      </Stack.Item>
    </Stack>
  );
};

type ConfigRowProps = {
  label: string;
  content: string;
  onClick: () => void;
  tooltip?: string;
  selected?: BooleanLike;
};

const ConfigRow = (props: ConfigRowProps) => {
  const { label, content, onClick, tooltip = '', selected = false } = props;

  return (
    <Table.Row
      className="candystripe"
      style={{ height: '2em', lineHeight: '2em' }}
    >
      <Table.Cell>
        <Box style={{ marginLeft: '5px' }}>{label}</Box>
      </Table.Cell>
      <Table.Cell
        style={{ width: 'min-content', whiteSpace: 'nowrap', textAlign: 'right' }}
      >
        <Button tooltip={tooltip} onClick={onClick} selected={!!selected}>
          {content}
        </Button>
      </Table.Cell>
    </Table.Row>
  );
};

const getPointButtonNumber = (offset: string): number | null => {
  const [dx, dy] = offset.split(',').map(Number);
  if (!Number.isFinite(dx) || !Number.isFinite(dy)) return null;
  if (dx < -1 || dx > 1 || dy < -1 || dy > 1) return null;
  if (dx === 0 && dy === 0) return null;
  const xIndex = dx + 1;
  const yIndex = 1 - dy;
  return yIndex * 3 + xIndex + 1;
};

const getFilteringModeText = (mode: number) => {
  switch (mode) {
    case 1: return 'Предметы';
    case 2: return 'Шкафы';
    case 3: return 'Люди';
    default: return 'Неизвестно';
  }
};

type TaskEditModalProps = {
  task: ManipulatorTask;
  onClose: () => void;
};

function TaskEditModal(props: TaskEditModalProps) {
  const { act, data } = useBackend<ManipulatorData>();
  const { task, onClose } = props;

  const adjust = (param: string, value?: any) =>
    act('adjust_task_param', { taskId: task.id, param, value });

  const isCargo = !!task.turf;
  const isPickup = task.task_type.includes('pickup');
  const isDropoff = task.task_type.includes('dropoff');
  const isInteract = task.task_type.includes('interact');

  const currentButton = task.turf
    ? getPointButtonNumber(task.turf)
    : null;

  return (
    <Modal style={{ padding: '6px', width: '340px', boxSizing: 'initial' }}>
      <Section
        title={`Правка: ${task.name}`}
        buttons={
          <Button icon="xmark" color="bad" onClick={onClose} />
        }
      >
        {task.task_type.includes('wait') && (
          <Table>
            <Table.Row className="candystripe" style={{ height: '2em', lineHeight: '2em' }}>
              <Table.Cell>
                <Box style={{ marginLeft: '5px' }}>Время ожидания</Box>
              </Table.Cell>
              <Table.Cell style={{ paddingRight: '5px' }}>
                <Slider
                  value={task.time ?? 1}
                  minValue={1}
                  maxValue={60}
                  step={1}
                  stepPixelSize={4}
                  unit="s"
                  onChange={(_e, value) => adjust('set_wait_time', value)}
                />
              </Table.Cell>
            </Table.Row>
          </Table>
        )}
        {isCargo && (
          <Stack>
            <Stack.Item>
              <Box
                style={{
                  display: 'grid',
                  gridTemplateColumns: '1fr 1fr 1fr',
                  gridTemplateRows: '1fr 1fr 1fr',
                  height: '60px',
                  width: '60px',
                  gap: '2px',
                  marginRight: '10px',
                }}
              >
                {[1, 2, 3, 4, 5, 6, 7, 8, 9].map((n) => (
                  <Button
                    key={n}
                    disabled={n === 5}
                    color={currentButton === n ? 'good' : 'default'}
                    onClick={() => n !== 5 && adjust('move_to', { buttonNumber: n })}
                    style={{ margin: '0', padding: '0', textAlign: 'center' }}
                    icon={buttonNumberToIcon[n]}
                  />
                ))}
              </Box>
            </Stack.Item>
            <Stack.Item grow>
              <Table>
                <ConfigRow
                  label="Тип объекта"
                  content={getFilteringModeText(task.filtering_mode ?? 1)}
                  onClick={() => adjust('cycle_filtering_mode')}
                  tooltip="Переключить категорию объекта"
                />
                <ConfigRow
                  label="Фильтры"
                  content={task.filters_status ? 'ВКЛ' : 'ВЫКЛ'}
                  onClick={() => adjust('toggle_filter_skip')}
                  tooltip="Переключить использование фильтров"
                />
                {isPickup && (
                  <ConfigRow
                    label="Готовность"
                    content={getValueLabel(task.pickup_eagerness)}
                    onClick={() => adjust('cycle_pickup_eagerness')}
                    tooltip="Ждать слот выгрузки или подбирать сразу"
                  />
                )}
                {isDropoff && (
                  <>
                    <ConfigRow
                      label="Режим"
                      content={getValueLabel(task.interaction_mode)}
                      onClick={() => adjust('cycle_interaction_mode')}
                      tooltip="Положить / бросить / использовать"
                    />
                    <ConfigRow
                      label="Переполнение"
                      content={getValueLabel(task.overflow_status)}
                      onClick={() => adjust('cycle_overflow_status')}
                      tooltip="Переключить поведение при переполнении"
                    />
                    {task.interaction_mode?.toUpperCase() === 'THROW' && (
                      <ConfigRow
                        label="Дальность броска"
                        content={`${task.throw_range} КЛ.`}
                        onClick={() => adjust('cycle_throw_range')}
                        tooltip="Переключить дальность броска"
                      />
                    )}
                  </>
                )}
                {(isDropoff || isInteract) && task.interaction_mode?.toUpperCase() !== 'THROW' && (
                  <>
                    <ConfigRow
                      label="Действие работника"
                      content={getValueLabel(task.worker_interaction)}
                      onClick={() => adjust('cycle_worker_interaction')}
                      tooltip="Обычное / один раз / пустая рука"
                    />
                    <ConfigRow
                      label="Альт-клик"
                      content={task.worker_use_rmb ? 'ВКЛ' : 'ВЫКЛ'}
                      onClick={() => adjust('toggle_worker_rmb')}
                      tooltip="Имитировать ПКМ"
                    />
                    <ConfigRow
                      label="Боевой режим"
                      content={task.worker_combat_mode ? 'ВКЛ' : 'ВЫКЛ'}
                      onClick={() => adjust('toggle_worker_combat')}
                      tooltip="Использовать боевой режим при взаимодействии"
                    />
                    <ConfigRow
                      label="Нет применений"
                      content={getValueLabel(task.use_post_interaction)}
                      onClick={() => adjust('cycle_post_interaction')}
                      tooltip="Что делать, когда больше не с чем взаимодействовать"
                    />
                  </>
                )}
              </Table>
            </Stack.Item>
          </Stack>
        )}
      </Section>

      {isCargo && (
        <>
          <Section
            title="Фильтры предметов"
            buttons={
              <>
                <Button
                  icon="plus"
                  onClick={() => adjust('add_atom_filter_from_held')}
                >
                  Добавить из руки
                </Button>
                <Button.Confirm
                  onClick={() => adjust('reset_atom_filters')}
                  confirmContent="Сбросить?"
                  icon="trash"
                />
              </>
            }
          >
            <Stack vertical>
              {(task.item_filters ?? []).map((name, index) => (
                <Stack key={index}>
                  <Stack.Item grow>
                    <BlockQuote>{name}</BlockQuote>
                  </Stack.Item>
                  <Stack.Item>
                    <Button
                      color="transparent"
                      icon="xmark"
                      onClick={() => adjust('delete_filter', index)}
                    />
                  </Stack.Item>
                </Stack>
              ))}
            </Stack>
          </Section>

          {(task.settings_list ?? []).length > 0 && (
            <Section title="Приоритеты взаимодействия">
              <Table>
                {task.settings_list!.map((setting, index) => (
                  <Table.Row className="candystripe" key={setting.name}>
                    <Table.Cell style={{ padding: '4px' }}>
                      <Icon name="hashtag" /> {index + 1}
                    </Table.Cell>
                    <Table.Cell>
                      <Button.Checkbox
                        onClick={() => adjust('toggle_priority', index)}
                        checked={!!setting.active}
                        fluid
                      >
                        {getValueLabel(setting.name)}
                      </Button.Checkbox>
                    </Table.Cell>
                    <Table.Cell width="1em">
                      <Button
                        icon="arrow-up"
                        disabled={index === 0}
                        onClick={() =>
                          index > 0 && adjust('priority_move_up', index)
                        }
                      />
                    </Table.Cell>
                  </Table.Row>
                ))}
              </Table>
            </Section>
          )}
        </>
      )}
    </Modal>
  );
};

const TaskList = () => {
  const { act, data } = useBackend<ManipulatorData>();
  const { tasks_data, current_task, tasking_strategy } = data;

  const [editingTask, setEditingTask] = useState<ManipulatorTask | null>(null);
  const [editingNameId, setEditingNameId] = useState<string | null>(null);
  const [newName, setNewName] = useState('');
  const [selectedType, setSelectedType] = useState<string>('pickup');

  const adjust = (taskId: string, param: string, value?: any) =>
    act('adjust_task_param', { taskId, param, value });

  const handleSaveName = (taskId: string) => {
    adjust(taskId, 'set_name', newName);
    setEditingNameId(null);
    setNewName('');
  };

  // keep modal in sync with live data
  useEffect(() => {
    if (!editingTask) return;
    const updated = tasks_data.find((t) => t.id === editingTask.id);
    if (updated) setEditingTask(updated);
  }, [tasks_data]);

  const strategyIcon =
    TASKING_STRATEGY_ICONS[tasking_strategy] ?? 'list-ol';

  return (
    <>
      <Section
        title="Задачи"
        buttons={
          <>
            <Button
              icon={strategyIcon}
              color="transparent"
              tooltip="Переключить стратегию задач"
              onClick={() => act('cycle_tasking_strategy', {
                new_strategy: tasking_strategy === 'Sequential' ? 'Strict order' : 'Sequential',
              })}
            >
              {TASKING_STRATEGY_LABELS[tasking_strategy] ?? tasking_strategy}
            </Button>
            <Button
              icon="arrows-spin"
              color="transparent"
              tooltip="Сбросить индекс задач"
              onClick={() => act('reset_tasking_index')}
            >
              Сброс
            </Button>
          </>
        }
      >
        <Stack vertical>
          {tasks_data.map((task, index) => {
            const isActive = current_task === task.id;
            const taskTypeKey = Object.keys(TASK_TYPE_LABELS).find((k) =>
              task.task_type.includes(k),
            ) ?? 'wait';

            return (
              <Stack.Item
                key={task.id}
                style={{
                  padding: '5px',
                  border: isActive ? '1px solid #bdad5e' : '1px solid transparent',
                  borderRadius: '2px',
                  boxShadow: isActive ? '0 0 6px 2px rgba(200, 168, 0, 0.55)' : undefined,
                  backgroundColor: isActive ? 'rgba(151, 142, 95, 0.55)' : undefined
                }}
                className="candystripe"
              >
                <Stack align="center">
                  <Stack.Item>
                    <Box
                      style={{
                        width: '1.4em',
                        textAlign: 'center',
                        color: '#888',
                        fontWeight: 'bold',
                      }}
                    >
                      {index + 1}
                    </Box>
                  </Stack.Item>
                  <Stack.Item>
                    <Icon
                      name={TASK_TYPE_ICONS[taskTypeKey] ?? 'circle'}
                      style={{ width: '1.2em', textAlign: 'center', marginRight: '5px' }}
                    />
                  </Stack.Item>
                  <Stack.Item grow>
                      <Box>
                        <Box bold style={{ display: 'inline' }}>
                          {TASK_TYPE_LABELS[taskTypeKey] ?? task.task_type}
                        </Box>
                        <Box color="label" fontSize="11px">

                          {task.item_filters && task.item_filters.length > 0 && (
                            <Box>
                              {'...любой из: ' +
                                task.item_filters.slice(0, 3).join(', ') +
                                (task.item_filters.length > 3 ? ` и еще ${task.item_filters.length - 3}` : '') +
                                '...'}
                            </Box>
                          )}
                          {task.turf && <Box>...на [{task.turf}]...</Box>}
                          {task.time && <Box>...на {task.time} сек...</Box>}
                        </Box>
                      </Box>
                  </Stack.Item>
                  <Stack.Item>
                    <Button
                      icon="gear"
                      color="transparent"
                      onClick={() => setEditingTask(task)}
                    />
                  </Stack.Item>
                  <Stack.Item>
                    <Button
                      icon="trash"
                      color="transparent"
                      onClick={() => adjust(task.id, 'remove_task')}
                    />
                  </Stack.Item>
                  <Stack.Item>
                    <Stack style={{ gap: '4px' }}>
                      <Stack.Item>
                        <Button
                          icon="arrow-down"
                          disabled={index === tasks_data.length - 1}
                          onClick={() => adjust(task.id, 'move_down')}
                        />
                      </Stack.Item>
                      <Stack.Item>
                        <Button
                          icon="arrow-up"
                          disabled={index === 0}
                          onClick={() => adjust(task.id, 'move_up')}
                        />
                      </Stack.Item>
                    </Stack>
                  </Stack.Item>
                </Stack>
              </Stack.Item>
            );
          })}
        </Stack>
      </Section>

      <Section>
        <Stack>
          <Stack.Item grow>
            <Dropdown
              width="100%"
              options={Object.keys(TASK_TYPE_LABELS).map((k) => ({
                value: k,
                displayText: TASK_TYPE_LABELS[k],
              }))}
              selected={TASK_TYPE_LABELS[selectedType]}
              onSelected={(val) => setSelectedType(val)}
            />
          </Stack.Item>
          <Stack.Item>
            <Button
              icon="plus"
              onClick={() => act('create_task', { task_type: selectedType })}
              style={{lineHeight: '22px'}}
            >
              Новая
            </Button>
          </Stack.Item>
        </Stack>
      </Section>

      {editingTask && (
        <TaskEditModal
          task={editingTask}
          onClose={() => setEditingTask(null)}
        />
      )}
    </>
  );
};

export const BigManipulator = () => {
  const { data, act } = useBackend<ManipulatorData>();
  const { active, stopping } = data;

  return (
    <Window title="Интерфейс манипулятора" width={420} height={560}>
      <Window.Content overflowY="auto">
        <Section
          title="Панель действий"
          buttons={
            <Button
              icon={!active ? 'play' : stopping ? 'hourglass-start' : 'stop'}
              color={!active ? 'good' : stopping ? 'blue' : 'bad'}
              onClick={() => act('run_cycle')}
            >
              {!active ? 'Запуск' : stopping ? 'Остановка' : 'Стоп'}
            </Button>
          }
        >
          <MasterControls />
        </Section>
        <Section

        >
          <Stack>
            <Stack.Item grow>
            <Button style={{
              width: '100%',
              lineHeight: '24px'
            }}
              icon={ data.disk_inserted ? "eject" : 'info' }
              disabled={!data.disk_inserted || !!active || !!stopping}
              color={!data.disk_inserted && "none"}
              onClick={() => act('disk_eject')}
            >
              { data.disk_inserted ? "дисковод (задач: " + data.disk_task_count + ")" : "Диск не вставлен" }
            </Button>
            </Stack.Item>
            <Stack.Item>
              <Button style={{
              lineHeight: '24px'
            }}
                icon="download"
                disabled={!data.disk_inserted || !!active || !!stopping}
                onClick={() => act('disk_read')}
              >
                Чтение
              </Button>
            </Stack.Item>
            <Stack.Item>
              <Button style={{
              lineHeight: '24px'
            }}
                icon="upload"
                disabled={!data.disk_inserted || !!data.disk_read_only || !!active || !!stopping}
                onClick={() => act('disk_write')}
              >
                Запись
              </Button>
            </Stack.Item>
            <Stack.Item>
              <Button.Confirm style={{
              lineHeight: '24px'
            }}
                icon="trash"
                disabled={!data.disk_inserted || !!data.disk_read_only || !!active || !!stopping}
                confirmContent="Очистить?"
                onClick={() => act('disk_clear')}
              >Очистить
              </Button.Confirm>
            </Stack.Item>
          </Stack>
        </Section>
        <TaskList />
      </Window.Content>
    </Window>
  );
};
