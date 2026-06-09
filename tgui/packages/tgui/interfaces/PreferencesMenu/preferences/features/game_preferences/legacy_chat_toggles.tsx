import { CheckboxInput, type FeatureToggle } from '../base';

export const chat_bankcard: FeatureToggle = {
  name: 'Уведомления о доходе',
  category: 'CHAT',
  description: 'Получать уведомления по вашему банковскому счёту.',
  component: CheckboxInput,
};

export const chat_dead: FeatureToggle = {
  name: 'Включить deadchat',
  category: 'ADMIN',
  component: CheckboxInput,
};

export const chat_ghostears: FeatureToggle = {
  name: 'Слышать все сообщения',
  category: 'GHOST',
  description: `
    Если включено, за призрака вы будете слышать всю речь.
    Если выключено, вы будете слышать только речь поблизости.
  `,
  component: CheckboxInput,
};

export const chat_ghostlaws: FeatureToggle = {
  name: 'Уведомления об изменении законов',
  category: 'GHOST',
  description: 'Если включено, за призрака вы будете получать уведомления об изменении законов.',
  component: CheckboxInput,
};

export const chat_ghostpda: FeatureToggle = {
  name: 'Уведомления КПК',
  category: 'GHOST',
  description: 'Если включено, за призрака вы будете получать уведомления о сообщениях КПК.',
  component: CheckboxInput,
};

export const chat_ghostradio: FeatureToggle = {
  name: 'Слышать радио',
  category: 'GHOST',
  description: 'Если включено, за призрака вы будете получать радио-сообщения.',
  component: CheckboxInput,
};

export const chat_ghostsight: FeatureToggle = {
  name: 'Видеть все эмоции',
  category: 'GHOST',
  description: 'Если включено, за призрака вы будете видеть все эмоции.',
  component: CheckboxInput,
};

export const chat_ghostwhisper: FeatureToggle = {
  name: 'Слышать весь шёпот',
  category: 'GHOST',
  description: `
    Если включено, за призрака вы будете слышать весь шёпот.
    Если выключено, вы будете слышать только шёпот поблизости.
  `,
  component: CheckboxInput,
};

export const chat_login_logout: FeatureToggle = {
  name: 'Сообщения входа/выхода',
  category: 'GHOST',
  description: 'Если включено, вы будете получать уведомления о входе и выходе игроков.',
  component: CheckboxInput,
};

export const chat_ooc: FeatureToggle = {
  name: 'Включить OOC',
  category: 'CHAT',
  component: CheckboxInput,
};

export const chat_prayer: FeatureToggle = {
  name: 'Слышать молитвы',
  category: 'ADMIN',
  component: CheckboxInput,
};

export const chat_pullr: FeatureToggle = {
  name: 'Уведомления pull request',
  category: 'CHAT',
  description: 'Получать уведомления о создании, закрытии или слиянии pull request.',
  component: CheckboxInput,
};
