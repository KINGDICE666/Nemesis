import { Button, NoticeBox, Stack } from 'tgui-core/components';

import { useBackend } from '../../backend';
import { RequestPriority, type RequestsData } from './types';

const localizeEmergency = (emergency: string) =>
  ({
    Security: 'Служба безопасности',
    Engineering: 'Инженерный отдел',
    Medical: 'Медицинский отдел',
  })[emergency] || emergency;

export const RequestsConsoleHeader = (props) => {
  const { act, data } = useBackend<RequestsData>();
  const { has_mail_send_error, new_message_priority } = data;
  return (
    <Stack.Item mb={1}>
      {!!has_mail_send_error && <ErrorNoticeBox />}
      {!!new_message_priority && <MessageNoticeBox />}
      <EmergencyBox />
    </Stack.Item>
  );
};

const EmergencyBox = (props) => {
  const { act, data } = useBackend<RequestsData>();
  const { emergency } = data;
  return (
    <>
      {!!emergency && (
        <NoticeBox danger>
          Вызван отдел: {localizeEmergency(emergency)}! RETA может открыть двери в зоне вызова.
        </NoticeBox>
      )}
      {!emergency && (
        <Stack fill>
          <Stack.Item grow>
            <Button
              fluid
              color="red"
              icon="shield"
              content="Вызвать СБ"
              onClick={() =>
                act('set_emergency', {
                  emergency: 'Security',
                })
              }
            />
          </Stack.Item>
          <Stack.Item grow>
            <Button
              fluid
              color="red"
              icon="screwdriver-wrench"
              content="Вызвать инженеров"
              onClick={() =>
                act('set_emergency', {
                  emergency: 'Engineering',
                })
              }
            />
          </Stack.Item>
          <Stack.Item grow>
            <Button
              fluid
              color="red"
              icon="suitcase-medical"
              content="Вызвать медиков"
              onClick={() =>
                act('set_emergency', {
                  emergency: 'Medical',
                })
              }
            />
          </Stack.Item>
        </Stack>
      )}
    </>
  );
};

const ErrorNoticeBox = (props) => {
  return (
    <NoticeBox danger>{'При отправке сообщения произошла ошибка!'}</NoticeBox>
  );
};

const MessageNoticeBox = (props) => {
  const { data } = useBackend<RequestsData>();
  const { new_message_priority } = data;
  return (
    <NoticeBox>
      {'У вас есть новые непрочитанные '}
      {new_message_priority === RequestPriority.HIGH && 'приоритетные '}
      {new_message_priority === RequestPriority.EXTREME && 'сообщения крайнего приоритета '}
      {'сообщения'}
    </NoticeBox>
  );
};
