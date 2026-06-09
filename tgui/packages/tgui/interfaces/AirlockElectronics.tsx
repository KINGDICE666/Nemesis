import {
  Button,
  Input,
  LabeledList,
  Section,
  Stack,
} from 'tgui-core/components';
import type { BooleanLike } from 'tgui-core/react';

import { useBackend } from '../backend';
import { Window } from '../layouts';
import { AccessConfig, type Region } from './common/AccessConfig';

type Data = {
  accesses: string[];
  oneAccess: BooleanLike;
  passedCycleId: string;
  passedName: string;
  regions: Region[];
  shell: BooleanLike;
  unres_direction: number;
};

export function AirlockElectronics(props) {
  return (
    <Window width={420} height={485}>
      <Window.Content>
        <AirLockMainSection />
      </Window.Content>
    </Window>
  );
}

export function AirLockMainSection(props) {
  const { act, data } = useBackend<Data>();
  const {
    accesses = [],
    oneAccess,
    passedName,
    passedCycleId,
    regions = [],
    unres_direction,
    shell,
  } = data;

  return (
    <Stack fill vertical>
      <Stack.Item>
        <Section fill>
          <LabeledList>
            <LabeledList.Item label="Корпус интегральной схемы">
              <Button.Checkbox
                checked={shell}
                onClick={() => {
                  act('set_shell', { on: !shell });
                }}
                tooltip="Можно ли установить интегральную схему внутрь этого шлюза."
              >
                Корпус
              </Button.Checkbox>
            </LabeledList.Item>
            <LabeledList.Item label="Требуемый доступ">
              <Button
                icon={oneAccess ? 'unlock' : 'lock'}
                onClick={() => act('one_access')}
              >
                {oneAccess ? 'Один' : 'Все'}
              </Button>
            </LabeledList.Item>
            <LabeledList.Item label="Свободный проход">
              <Button
                icon={unres_direction & 1 ? 'check-square-o' : 'square-o'}
                selected={unres_direction & 1}
                onClick={() =>
                  act('direc_set', {
                    unres_direction: '1',
                  })
                }
              >
                Север
              </Button>
              <Button
                icon={unres_direction & 2 ? 'check-square-o' : 'square-o'}
                selected={unres_direction & 2}
                onClick={() =>
                  act('direc_set', {
                    unres_direction: '2',
                  })
                }
              >
                Юг
              </Button>
              <Button
                icon={unres_direction & 4 ? 'check-square-o' : 'square-o'}
                selected={unres_direction & 4}
                onClick={() =>
                  act('direc_set', {
                    unres_direction: '4',
                  })
                }
              >
                Восток
              </Button>
              <Button
                icon={unres_direction & 8 ? 'check-square-o' : 'square-o'}
                selected={unres_direction & 8}
                onClick={() =>
                  act('direc_set', {
                    unres_direction: '8',
                  })
                }
              >
                Запад
              </Button>
            </LabeledList.Item>
            <LabeledList.Item label="Название шлюза">
              <Input
                fluid
                maxLength={30}
                value={passedName}
                onBlur={(value) =>
                  act('passedName', {
                    passedName: value,
                  })
                }
              />
            </LabeledList.Item>
            <LabeledList.Item label="ID цикла">
              <Input
                fluid
                maxLength={30}
                value={passedCycleId}
                onBlur={(value) =>
                  act('passedCycleId', {
                    passedCycleId: value,
                  })
                }
              />
            </LabeledList.Item>
          </LabeledList>
        </Section>
      </Stack.Item>
      <Stack.Item grow>
        <AccessConfig
          accesses={regions}
          selectedList={accesses}
          accessMod={(ref) =>
            act('set', {
              access: ref,
            })
          }
          grantAll={() => act('grant_all')}
          denyAll={() => act('clear_all')}
          grantDep={(ref) =>
            act('grant_region', {
              region: ref,
            })
          }
          denyDep={(ref) =>
            act('deny_region', {
              region: ref,
            })
          }
        />
      </Stack.Item>
    </Stack>
  );
}
