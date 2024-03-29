echo "------------------"
pwd
echo "------------------"

echo "Copy raw Mass Spectra files"
polly files sync --workspace-id $WORKSPACE_ID_FOR_raw_FILES \
-s polly://$FOLDER_PATH_OF_raw_FILES \
-d /import/Pride_PXD006395_Raw

echo "Copying organism specific proteome Fasta file"
polly files copy --workspace-id $WORKSPACE_ID_FOR_Fasta_FILES \
-s "polly://$FOLDER_PATH_OF_Fasta_FILES" \
-d '/import/fasta/UP000005640_9606.fasta'

echo "----------------------"
echo "----------------------"
echo "copy mqpar_new.xml file"
polly files copy --workspace-id $CONFIG_FILE_WORKSPACE_ID \
-s polly://$CONFIG_FILE_PATH \
-d /import/config.xml

echo "---------------------"
echo "Lauch MaxQuantCmd.exe"
echo "---------------------"
dotnet /import/MaxQuant_2.1.3.0/bin/MaxQuantCmd.exe /import/config.xml 

echo "----------------------"
echo "Copying output files"
echo "----------------------"
#mkdir -p /import/MaxQuant_output_dir
#mv ./* /import/MaxQuant_output_dir
#polly files sync --workspace-id $MaxQuantOUTPUT_WORKSPACE_ID \
#-s /import \
#-d polly://$MaxQuant_OUTPUT_PATH

polly files sync --workspace-id $MaxQuant_OUTPUT_WORKSPACE_ID \
-s /import -d polly://$MaxQuant_OUTPUT_PATH

echo "------------------"

