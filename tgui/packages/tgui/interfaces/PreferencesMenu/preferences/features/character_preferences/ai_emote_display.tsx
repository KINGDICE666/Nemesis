import {
  FeatureIconnedDropdownInput,
  type FeatureWithIcons,
} from '../dropdowns';

export const preferred_ai_emote_display: FeatureWithIcons<string> = {
  name: 'Эмоции ИИ',
  description:
    'If you are the AI, the default image displayed on all AI displays on station.',
  component: FeatureIconnedDropdownInput,
};
