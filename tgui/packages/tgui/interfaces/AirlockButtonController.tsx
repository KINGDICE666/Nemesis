import { Button, NoticeBox, Section, Stack } from 'tgui-core/components';
import type { BooleanLike } from 'tgui-core/react';

import { useBackend } from '../backend';
import { Window } from '../layouts';

type Data = {
  interior_door: string;
  exterior_door: string;
  interior_door_closed: BooleanLike;
  exterior_door_closed: BooleanLike;
  busy: BooleanLike;
};

export const AirlockButtonController = (props) => {
  const { data } = useBackend<Data>();
  const { interior_door, exterior_door } = data;
  return (
    <Window width={500} height={130}>
      <Window.Content>
        <Section title="Контроллер шлюза" textAlign="center">
          {!interior_door && !exterior_door ? (
            <NoticeBox danger>Двери не обнаружены</NoticeBox>
          ) : (
            <Stack>
              {interior_door && (
                <Stack.Item grow textAlign="center">
                  <RetrieveButton airlockType={interior_door} />
                </Stack.Item>
              )}
              {exterior_door && (
                <Stack.Item grow textAlign="center">
                  <RetrieveButton airlockType={exterior_door} />
                </Stack.Item>
              )}
            </Stack>
          )}
        </Section>
      </Window.Content>
    </Window>
  );
};

const RetrieveButton = (props) => {
  const { act, data } = useBackend<Data>();
  const {
    interior_door,
    exterior_door,
    interior_door_closed,
    exterior_door_closed,
    busy,
  } = data;
  const { airlockType } = props;
  const our_door_closed =
    airlockType === interior_door ? interior_door_closed : exterior_door_closed;
  const opposite_door_closed =
    airlockType === interior_door ? exterior_door_closed : interior_door_closed;
  const opposite_door =
    airlockType === interior_door ? exterior_door : interior_door;

  return (
    <Button
      mt={2}
      icon={our_door_closed ? 'lock-open' : 'lock'}
      color="green"
      fontSize={1.5}
      textAlign="center"
      lineHeight="1.5"
      disabled={busy}
      onClick={() => {
        if (!our_door_closed) {
          act('close', {
            requested_door: airlockType,
          });
        } else {
          act('open', {
            requested_door: airlockType,
          });
        }
      }}
    >
      {!our_door_closed
        ? `Закрыть ${
            airlockType === interior_door ? 'внутреннюю дверь' : 'внешнюю дверь'
          }`
        : !opposite_door_closed && opposite_door
          ? `Переключить на ${
              airlockType === interior_door ? 'внутреннюю дверь' : 'внешнюю дверь'
            }`
          : `Открыть ${
              airlockType === interior_door ? 'внутреннюю дверь' : 'внешнюю дверь'
            }`}
    </Button>
  );
};
