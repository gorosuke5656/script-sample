@Rem ���炩���߃p�P�b�g�i�[�t�H���_���쐬���Ă����i�����C:\Users\���[�U�[\Desktop\pcap�j

@echo off
whoami /priv | find "SeDebugPrivilege" > nul
if %errorlevel% neq 0 (
 @powershell start-process %~0 -verb runas
 exit
)

@echo on
@echo �l�b�g���[�N�C���^�[�t�F�C�X�ꗗ
"C:\Program Files\Wireshark\tshark.exe" -D

@Rem �l�b�g���[�N�C���^�[�t�F�C�X����͂���
SET /P interface_id="�L���v�`���������C���^�[�t�F�C�X�����!!�F"

@Rem �p�P�b�g�̕ۑ��Ԋu����͂���
set /p time_duration="�ۑ��Ԋu(��)�����!!�F"
set /a "time_duration *= 60"

@echo Wireshark�Ńp�P�b�g��ۑ����܂��B�I�����������ꍇ��Ctrl+C�������Ă�������!!

"C:\Program Files\Wireshark\dumpcap.exe" -i %interface_id% -b duration:%time_duration% -w C:\Users\���[�U�[\Desktop\pcap\packet.pcapng




pause

