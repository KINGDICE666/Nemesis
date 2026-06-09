import {
  CheckboxInput,
  FeatureNumberInput,
  type FeatureNumeric,
  type FeatureToggle,
} from '../base';

export const chat_on_map: FeatureToggle = {
  name: 'Включить Runechat',
  category: 'RUNECHAT',
  description: 'Сообщения чата будут отображаться над головами.',
  component: CheckboxInput,
};

export const see_chat_non_mob: FeatureToggle = {
  name: 'Runechat на объектах',
  category: 'RUNECHAT',
  description: 'Сообщения чата будут отображаться над говорящими объектами.',
  component: CheckboxInput,
};

export const chat_on_ghosts: FeatureToggle = {
  name: 'Runechat у призраков',
  category: 'RUNECHAT',
  description: 'Сообщения чата будут отображаться над говорящими призраками.',
  component: CheckboxInput,
};

export const see_rc_emotes: FeatureToggle = {
  name: 'Эмоции в Runechat',
  category: 'RUNECHAT',
  description: 'Эмоции будут отображаться над головами.',
  component: CheckboxInput,
};

export const max_chat_length: FeatureNumeric = {
  name: 'Максимальная длина чата',
  category: 'RUNECHAT',
  description: 'Максимальная длина сообщения, которое будет показано в Runechat.',
  component: FeatureNumberInput,
};
