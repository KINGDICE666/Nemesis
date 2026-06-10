import { useBackend, useLocalState } from 'tgui/backend';

import {
  PRINTOUT,
  type SecurityRecord,
  type SecurityRecordsData,
} from './types';

/** We need an active reference and this a pain to rewrite */
export const getSecurityRecord = () => {
  const [selectedRecord] = useLocalState<SecurityRecord | undefined>(
    'securityRecord',
    undefined,
  );
  if (!selectedRecord) return;
  const { data } = useBackend<SecurityRecordsData>();
  const { records = [] } = data;
  const foundRecord = records.find(
    (record) => record.crew_ref === selectedRecord.crew_ref,
  );
  if (!foundRecord) return;

  return foundRecord;
};

// Lazy type union
type GenericRecord = {
  name: string;
  rank: string;
  fingerprint?: string;
  dna?: string;
};

/** Matches search by fingerprint, dna, job, or name */
export const isRecordMatch = (record: GenericRecord, search: string) => {
  if (!search) return true;
  const { name, rank, fingerprint, dna } = record;

  switch (true) {
    case name?.toLowerCase().includes(search?.toLowerCase()):
    case rank?.toLowerCase().includes(search?.toLowerCase()):
    case fingerprint?.toLowerCase().includes(search?.toLowerCase()):
    case dna?.toLowerCase().includes(search?.toLowerCase()):
      return true;

    default:
      return false;
  }
};

/** Returns a string header based on print type */
export const getDefaultPrintHeader = (printType: PRINTOUT) => {
  switch (printType) {
    case PRINTOUT.Rapsheet:
      return 'RECORD';
    case PRINTOUT.Wanted:
      return 'WANTED';
    case PRINTOUT.Missing:
      return 'MISSING';
  }
};

/** Returns a string description based on print type */
export const getDefaultPrintDescription = (
  name: string,
  printType: PRINTOUT,
) => {
  switch (printType) {
    case PRINTOUT.Rapsheet:
      return `Стандартная запись службы безопасности на ${name}.`;
    case PRINTOUT.Wanted:
      return `Плакат объявляет ${name} в розыск Nanotrasen. При обнаружении немедленно сообщите службе безопасности.`;
    case PRINTOUT.Missing:
      return `Плакат объявляет ${name} пропавшим сотрудником Nanotrasen. При обнаружении немедленно сообщите службе безопасности.`;
  }
};
