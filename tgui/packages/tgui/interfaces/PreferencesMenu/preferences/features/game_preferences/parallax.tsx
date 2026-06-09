import type { Feature } from '../base';
import { FeatureDropdownInput } from '../dropdowns';

export const parallax: Feature<string> = {
  name: 'Параллакс космоса',
  category: 'GAMEPLAY',
  component: FeatureDropdownInput,
};
