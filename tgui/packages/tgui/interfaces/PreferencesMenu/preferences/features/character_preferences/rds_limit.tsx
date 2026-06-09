import { CheckboxInput, type FeatureToggle } from '../base';

export const rds_limit: FeatureToggle = {
  name: 'Снять лимит галлюцинаций',
  description:
    'Checking this box will remove limitations on hallucinations, \
    causing them to be more frequent, intrusive, and (generally) wacky.',
  component: CheckboxInput,
};
