import { CheckboxInput, type FeatureToggle } from '../base';

export const broadcast_login_logout: FeatureToggle = {
  name: 'Сообщать о входе/выходе',
  category: 'GAMEPLAY',
  description: `
    Если включено, отключение и повторное подключение будут объявляться в deadchat.
  `,
  component: CheckboxInput,
};
