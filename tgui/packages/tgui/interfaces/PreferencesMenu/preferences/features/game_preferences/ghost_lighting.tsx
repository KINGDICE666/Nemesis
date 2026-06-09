import type { FeatureChoiced } from '../base';
import { FeatureDropdownInput } from '../dropdowns';

export const ghost_lighting: FeatureChoiced = {
  name: 'Освещение призрака',
  component: FeatureDropdownInput,
  category: 'GHOST',
  description: 'Влияет на яркость освещения для призраков',
};
