import {
  FeatureIconnedDropdownInput,
  type FeatureWithIcons,
} from '../dropdowns';

export const preferred_ai_hologram_display: FeatureWithIcons<string> = {
  name: 'Вид голограммы ИИ',
  description: 'Голографическая форма, которую вы примете при использовании голопада.',
  component: FeatureIconnedDropdownInput,
};
