import type { Feature } from '../base';
import { FeatureDropdownInput } from '../dropdowns';

export const mod_select: Feature<string> = {
  name: 'Клавиша активного модуля MOD',
  category: 'GAMEPLAY',
  description: 'Клавиша для использования активного модуля MOD-костюма.',
  component: FeatureDropdownInput,
};
