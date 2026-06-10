import { NoticeBox } from 'tgui-core/components';
import type { BooleanLike } from 'tgui-core/react';

import { useBackend } from '../backend';
import { Window } from '../layouts';
import { LaunchpadControl } from './LaunchpadConsole';

type Data = {
  has_pad: BooleanLike;
  pad_closed: BooleanLike;
};

export const LaunchpadRemote = (props) => {
  const { data } = useBackend<Data>();
  const { has_pad, pad_closed } = data;

  return (
    <Window
      title="Пульт телепортационной площадки"
      width={340}
      height={275}
      theme="syndicate"
    >
      <Window.Content>
        {(!has_pad && <NoticeBox>Площадка не подключена</NoticeBox>) ||
          (pad_closed && <NoticeBox>Площадка закрыта</NoticeBox>) || (
            <LaunchpadControl topLevel />
          )}
      </Window.Content>
    </Window>
  );
};
