@echo off
rem Ping�̈���IP�A�h���X���w�肵�܂��B������Ping�����s������IP�A�h���X�ɏ��������Ă��������B
set IPADDRESS=8.8.8.8
   
rem ���ʂ��o�͂���t�@�C�������w�肵�܂��B
set FILENAME=Ping����.log
   
rem �����Ŏg�������Ȃǂ��w�肵�܂��B
set COMMAND=ping %IPADDRESS%
set PACKET=�p�P�b�g��: ���M = 4�A��M = 4�A���� = 0 (0%% �̑���)�A
set RESPONSE=����̉���
set OKMESSAGE=Ping��
set NGMESSAGE=Ping�~(�ʂɌ��ʂ��m�F���Ă��������B)
set RESPONSE_RESULT=NG
set PACKET_RESULT=NG
   
rem �f�X�N�g�b�v�ցuPing����.log�v�̃t�@�C�����쐬�B�t�@�C����Ping�R�}���h���������ށB
echo %COMMAND% > Ping����.log
   
rem Ping�R�}���h�����s���āA�f�X�N�g�b�v�́uPing����.log�v�֌��ʂ��������ށB
%COMMAND% >> Ping����.log
   
rem �uPing����.log�v�̓��e���P�s���ǂݍ��ށB
for /f "delims=" %%i in (%FILENAME%) do (
    rem �����󋵂̍s�����f����B
    echo "%%i" | find "%RESPONSE%" > NUL
    if not errorlevel 1 (
        rem ����������IP�A�h���X�����f����B
        echo "%%i" | find "%IPADDRESS%" > NUL
        if not errorlevel 1 (
            rem OK�t���O�𗧂Ă�B
            set RESPONSE_RESULT=OK
        )
    )
   
    rem �S�Ẵp�P�b�g���������Ă��邩���f����B
    echo "%%i" | find "%PACKET%" > NUL
    if not errorlevel 1 (
        rem OK�t���O�𗧂Ă�B
        set PACKET_RESULT=OK
    )
)
   
rem ����OK�̏ꍇ��Ping����\������B
if %RESPONSE_RESULT%==OK (
    if %PACKET_RESULT%==OK (
        rem �R�}���h�v�����v�g�̉�ʂɁuPing���v��\��
        echo Ping��
        rem �u:ENDBAT�v�Ɉړ�����B
        goto ENDBAT
    )
)
rem �R�}���h�v�����v�g�̉�ʂɁuPing�~�v��\������B
echo Ping�~
   
:ENDBAT
   
rem �u���s����ɂ͉����L�[�������Ă�������...�v��\�����ē��͑҂��ɂ��܂��B
pause