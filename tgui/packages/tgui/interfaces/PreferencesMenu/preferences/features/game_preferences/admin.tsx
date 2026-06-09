import {
  CheckboxInput,
  type Feature,
  FeatureColorInput,
  type FeatureToggle,
} from '../base';
import { FeatureDropdownInput } from '../dropdowns';

export const asaycolor: Feature<string> = {
  name: 'Цвет админ-чата',
  category: 'ADMIN',
  description: 'Цвет ваших сообщений в Adminsay.',
  component: FeatureColorInput,
};

export const brief_outfit: Feature<string> = {
  name: 'Экипировка брифинга',
  category: 'ADMIN',
  description: 'Экипировка при появлении офицером брифинга.',
  component: FeatureDropdownInput,
};

export const bypass_deadmin_in_centcom: FeatureToggle = {
  name: 'Не деадминиться в ЦентКоме',
  category: 'ADMIN',
  description:
    'Оставаться ли админом при появлении в ЦентКоме.',
  component: CheckboxInput,
};

export const fast_mc_refresh: FeatureToggle = {
  name: 'Быстрое обновление MC в Stat Panel',
  category: 'ADMIN',
  description:
    'Должна ли вкладка MC в Stat Panel обновляться быстро. Это затратно, включайте только при необходимости.',
  component: CheckboxInput,
};

export const ghost_roles_as_admin: FeatureToggle = {
  name: 'Получать роли призрака под админом',
  category: 'ADMIN',
  description: `
    Если выключить это, предложения ролей призрака не будут приходить,
    пока вы админ. Для обычного игрока после деадмина уведомления не скрываются.
`,
  component: CheckboxInput,
};

export const comms_notification: FeatureToggle = {
  name: 'Звук консоли связи',
  category: 'ADMIN',
  component: CheckboxInput,
};

export const auto_deadmin_on_ready_or_latejoin: FeatureToggle = {
  name: 'Авто-деадмин при готовности/latejoin',
  category: 'ADMIN',
  description: `
    Если включено, вы автоматически деадминитесь при готовности или позднем входе в раунд.
`,
  component: CheckboxInput,
};
