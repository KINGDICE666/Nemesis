import {
  CheckboxInput,
  CheckboxInputInverse,
  type FeatureToggle,
} from '../base';

export const admin_ignore_cult_ghost: FeatureToggle = {
  name: 'Не призывать как культового призрака',
  category: 'ADMIN',
  description: `
    Если включено во время наблюдения, Spirit Realm не сможет принудительно
    сделать вас культовым призраком.
  `,
  component: CheckboxInput,
};

export const announce_login: FeatureToggle = {
  name: 'Объявлять вход',
  category: 'ADMIN',
  description: 'Админы получат уведомление, когда вы войдёте.',
  component: CheckboxInput,
};

export const combohud_lighting: FeatureToggle = {
  name: 'Fullbright Combo HUD',
  category: 'ADMIN',
  component: CheckboxInput,
};

export const deadmin_always: FeatureToggle = {
  name: 'Авто-деадмин всегда',
  category: 'ADMIN',
  description: 'Если включено, вы будете автоматически деадминиться.',
  component: CheckboxInput,
};

export const deadmin_antagonist: FeatureToggle = {
  name: 'Авто-деадмин за антагониста',
  category: 'ADMIN',
  description: 'Если включено, вы будете автоматически деадминиться за антагониста.',
  component: CheckboxInput,
};

export const deadmin_position_head: FeatureToggle = {
  name: 'Авто-деадмин за главу отдела',
  category: 'ADMIN',
  description:
    'Если включено, вы будете автоматически деадминиться за главу отдела.',
  component: CheckboxInput,
};

export const deadmin_position_security: FeatureToggle = {
  name: 'Авто-деадмин за СБ',
  category: 'ADMIN',
  description:
    'Если включено, вы будете автоматически деадминиться за сотрудника СБ.',
  component: CheckboxInput,
};

export const deadmin_position_silicon: FeatureToggle = {
  name: 'Авто-деадмин за синтетика',
  category: 'ADMIN',
  description: 'Если включено, вы будете автоматически деадминиться за синтетика.',
  component: CheckboxInput,
};

export const disable_arrivalrattle: FeatureToggle = {
  name: 'Уведомлять о новых прибытиях',
  category: 'GHOST',
  description: 'Если включено, за призрака вы будете получать уведомления о новом экипаже.',
  component: CheckboxInputInverse,
};

export const disable_deathrattle: FeatureToggle = {
  name: 'Уведомлять о смертях',
  category: 'GHOST',
  description:
    'Если включено, за призрака вы будете получать уведомления о смертях.',
  component: CheckboxInputInverse,
};

export const member_public: FeatureToggle = {
  name: 'Показывать BYOND membership',
  category: 'CHAT',
  description:
    'Если включено, рядом с вашим именем в OOC будет показан логотип BYOND.',
  component: CheckboxInput,
};

export const sound_adminhelp: FeatureToggle = {
  name: 'Звуки adminhelp',
  category: 'ADMIN',
  component: CheckboxInput,
};

export const sound_prayers: FeatureToggle = {
  name: 'Звук молитв',
  category: 'ADMIN',
  component: CheckboxInput,
};

export const split_admin_tabs: FeatureToggle = {
  name: 'Разделять админ-вкладки',
  category: 'ADMIN',
  description: "Если включено, панель 'Admin' будет разделена на несколько вкладок.",
  component: CheckboxInput,
};
