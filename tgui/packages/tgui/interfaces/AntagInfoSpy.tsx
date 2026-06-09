import { Section, Stack } from 'tgui-core/components';
import type { BooleanLike } from 'tgui-core/react';

import { useBackend } from '../backend';
import { Window } from '../layouts';
import {
  type Objective,
  ObjectivePrintout,
  ReplaceObjectivesButton,
} from './common/Objectives';

const greenText = {
  fontWeight: 'italics',
  color: '#20b142',
};

const redText = {
  fontWeight: 'italics',
  color: '#e03c3c',
};

type Data = {
  antag_name: string;
  uplink_location: string | null;
  objectives: Objective[];
  can_change_objective: BooleanLike;
};

export const AntagInfoSpy = () => {
  const { data } = useBackend<Data>();
  const { antag_name, uplink_location, objectives, can_change_objective } =
    data;
  return (
    <Window width={380} height={450} theme="ntos_darkmode">
      <Window.Content
        style={{
          backgroundImage: 'none',
        }}
      >
        <Section title={`Вы - ${antag_name || 'Шпион'}.`}>
          <Stack vertical fill ml={1} mr={1}>
            <Stack.Item fontSize={1.2}>
              Вам выдали специальное устройство аплинка, замаскированное под{' '}
              {uplink_location || 'какой-то предмет'}, с его помощью можно
              красть со станции.
            </Stack.Item>
            <Stack.Item>
              <span style={greenText}>
                <b>Используйте его в руке</b>, чтобы открыть аплинк, и{' '}
                <b>кликайте правой кнопкой</b> по целям заказов, чтобы украсть
                их.
              </span>
            </Stack.Item>
            <Stack.Divider />
            <Stack.Item>
              Вы можете быть не один: на станции могут быть другие шпионы.
            </Stack.Item>
            <Stack.Item>
              Работать вместе или против них - решать вам, но{' '}
              <span style={redText}>
                один и тот же заказ нельзя сдать дважды.
              </span>
            </Stack.Item>
            <Stack.Divider />
            <Stack.Item>
              <ObjectivePrintout
                titleMessage={'Ваша миссия, если вы решите её принять'}
                objectives={objectives}
              />
            </Stack.Item>
            <Stack.Divider />
            <Stack.Item textAlign="center">
              {
                <ReplaceObjectivesButton
                  can_change_objective={can_change_objective}
                  button_title={'Составить свой план'}
                  button_colour={'green'}
                />
              }
            </Stack.Item>
          </Stack>
        </Section>
      </Window.Content>
    </Window>
  );
};
