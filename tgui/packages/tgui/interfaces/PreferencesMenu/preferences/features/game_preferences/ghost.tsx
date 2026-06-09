import { binaryInsertWith } from 'common/collections';
import type { ReactNode } from 'react';
import { useBackend } from 'tgui/backend';
import { Box, Dropdown, Flex } from 'tgui-core/components';
import { classes } from 'tgui-core/react';

import type { PreferencesMenuData } from '../../../types';
import {
  CheckboxInput,
  type FeatureChoiced,
  type FeatureChoicedServerData,
  type FeatureToggle,
  type FeatureValueProps,
} from '../base';
import { FeatureDropdownInput } from '../dropdowns';

export const ghost_accs: FeatureChoiced = {
  name: 'Аксессуары призрака',
  category: 'GHOST',
  description: 'Определяет дополнительные элементы внешности вашего призрака.',
  component: FeatureDropdownInput,
};

type GhostForm = {
  displayText: ReactNode;
  value: string;
};

function insertGhostForm(collection: GhostForm[], value: GhostForm) {
  return binaryInsertWith(collection, value, ({ value }) => value);
}

function GhostFormInput(
  props: FeatureValueProps<string, string, FeatureChoicedServerData>,
) {
  const { data } = useBackend<PreferencesMenuData>();

  const serverData = props.serverData;
  if (!serverData) {
    return;
  }

  const displayNames = serverData.display_names;
  if (!displayNames) {
    return <Box color="red">Нет отображаемых имён для ghost_form!</Box>;
  }

  const displayTexts = {};
  let options: {
    displayText: ReactNode;
    value: string;
  }[] = [];

  for (const [name, displayName] of Object.entries(displayNames)) {
    const displayText = (
      <Flex key={name}>
        <Flex.Item>
          <Box
            className={classes([`preferences32x32`, serverData.icons![name]])}
          />
        </Flex.Item>

        <Flex.Item grow={1}>{displayName}</Flex.Item>
      </Flex>
    );

    displayTexts[name] = displayText;

    const optionEntry = {
      displayText,
      value: name,
    };

    // Put the default ghost on top
    if (name === 'ghost') {
      options.unshift(optionEntry);
    } else {
      options = insertGhostForm(options, optionEntry);
    }
  }

  return (
    <Dropdown
      autoScroll={false}
      disabled={!data.content_unlocked}
      selected={props.value}
      placeholder={displayTexts[props.value]}
      onSelected={props.handleSetValue}
      width="100%"
      options={options}
    />
  );
}

export const ghost_form: FeatureChoiced = {
  name: 'Форма призрака',
  category: 'GHOST',
  description: 'Внешний вид вашего призрака. Требуется BYOND membership.',
  component: GhostFormInput,
};

export const ghost_hud: FeatureToggle = {
  name: 'HUD призрака',
  category: 'GHOST',
  description: 'Включает HUD-кнопки для призраков.',
  component: CheckboxInput,
};

export const ghost_orbit: FeatureChoiced = {
  name: 'Орбита призрака',
  category: 'GHOST',
  description: `
    Форма, по которой ваш призрак будет летать вокруг цели.
    Требуется BYOND membership.
  `,
  component: (
    props: FeatureValueProps<string, string, FeatureChoicedServerData>,
  ) => {
    const { data } = useBackend<PreferencesMenuData>();

    return (
      <FeatureDropdownInput {...props} disabled={!data.content_unlocked} />
    );
  },
};

export const ghost_others: FeatureChoiced = {
  name: 'Призраки других',
  category: 'GHOST',
  description: `
    Показывать ли призраков других игроков с их настройками,
    стандартными спрайтами или всегда как белых призраков?
  `,
  component: FeatureDropdownInput,
};

export const inquisitive_ghost: FeatureToggle = {
  name: 'Любопытство призрака',
  category: 'GHOST',
  description: 'Клик по объекту за призрака будет осматривать его.',
  component: CheckboxInput,
};

export const ghost_roles: FeatureToggle = {
  name: 'Получать роли призрака',
  category: 'GHOST',
  description: `
    Если выключить это, всплывающие предложения ролей призрака не будут приходить.
    Все такие окна будут скрыты, пока вы призрак. Полезно, если роли призрака
    или всплывающие окна вам мешают.
`,
  component: CheckboxInput,
};
