import { CheckboxInput, type FeatureToggle } from '../base';

export const buttons_locked: FeatureToggle = {
  name: 'Закрепить кнопки действий',
  category: 'GAMEPLAY',
  description: 'Если включено, кнопки действий будут закреплены на месте.',
  component: CheckboxInput,
};
