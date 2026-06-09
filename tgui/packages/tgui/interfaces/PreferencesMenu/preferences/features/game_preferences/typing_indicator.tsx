import { CheckboxInput, type FeatureToggle } from '../base';

export const typingIndicator: FeatureToggle = {
  name: 'Индикатор набора для себя',
  category: 'GAMEPLAY',
  description: 'Показывает индикатор, когда вы набираете сообщение.',
  component: CheckboxInput,
};
