#!/bin/bash
echo "About to back up /geog/data/sirius/epsilon/ggwillc/* to /geog/data/sirius/epsilon/ggwillc/*..."
sirius_home=/geog/data/sirius/epsilon/ggwillc/
#/geog/data/sirius/epsilon/ggwillc/* back up list VALID FOR: 08/10/14

rsync -av $sirius_home/FFT /geog/data/arcturus/epsilon/ggwillc/SIRIUS_EPSILON_NEW_BACKUP/
rsync -av $sirius_home/FFT_1D /geog/data/arcturus/epsilon/ggwillc/SIRIUS_EPSILON_NEW_BACKUP/ 
rsync -av $sirius_home/FFT2 /geog/data/arcturus/epsilon/ggwillc/SIRIUS_EPSILON_NEW_BACKUP/
rsync -av $sirius_home/FFT_2D /geog/data/arcturus/epsilon/ggwillc/SIRIUS_EPSILON_NEW_BACKUP/
rsync -av $sirius_home/FFT_moving_window_runs /geog/data/arcturus/epsilon/ggwillc/SIRIUS_EPSILON_NEW_BACKUP/
rsync -av $sirius_home/filter_transects /geog/data/arcturus/epsilon/ggwillc/SIRIUS_EPSILON_NEW_BACKUP/
rsync -av $sirius_home/Gaussian_surface_filtering /geog/data/arcturus/epsilon/ggwillc/SIRIUS_EPSILON_NEW_BACKUP/
rsync -av $sirius_home/Helheim /geog/data/arcturus/epsilon/ggwillc/SIRIUS_EPSILON_NEW_BACKUP/
rsync -av $sirius_home/Helheim_ASTER /geog/data/arcturus/epsilon/ggwillc/SIRIUS_EPSILON_NEW_BACKUP/
rsync -av $sirius_home/HELHEIM_feature_tracking /geog/data/arcturus/epsilon/ggwillc/SIRIUS_EPSILON_NEW_BACKUP/
rsync -av $sirius_home/Helheim_Hyperspec_Classification /geog/data/arcturus/epsilon/ggwillc/SIRIUS_EPSILON_NEW_BACKUP/
rsync -av $sirius_home/HELHEIM_LIDAR_feature_tracking /geog/data/arcturus/epsilon/ggwillc/SIRIUS_EPSILON_NEW_BACKUP/
rsync -av $sirius_home/Hyperspec_classification_SPECTRAL_GEOMETRY /geog/data/arcturus/epsilon/ggwillc/SIRIUS_EPSILON_NEW_BACKUP/
rsync -av $sirius_home/Images_for_presentations /geog/data/arcturus/epsilon/ggwillc/SIRIUS_EPSILON_NEW_BACKUP/
rsync -av $sirius_home/KNS_feature_tracking /geog/data/arcturus/epsilon/ggwillc/SIRIUS_EPSILON_NEW_BACKUP/
rsync -av $sirius_home/KNS_Hyperspec_Classification_ISODATA /geog/data/arcturus/epsilon/ggwillc/SIRIUS_EPSILON_NEW_BACKUP/
rsync -av $sirius_home/KNS_Hyperspec_Classification_MLC /geog/data/arcturus/epsilon/ggwillc/SIRIUS_EPSILON_NEW_BACKUP/
rsync -av $sirius_home/KNS_hyperspectral_extra_processing_outputs /geog/data/arcturus/epsilon/ggwillc/SIRIUS_EPSILON_NEW_BACKUP/
rsync -av $sirius_home/KNS_LIDAR_feature_tracking /geog/data/arcturus/epsilon/ggwillc/SIRIUS_EPSILON_NEW_BACKUP/
rsync -av $sirius_home/KNS_lidar_manual_feature_tracking /geog/data/arcturus/epsilon/ggwillc/SIRIUS_EPSILON_NEW_BACKUP/
rsync -av $sirius_home/KNS_surface_analysis /geog/data/arcturus/epsilon/ggwillc/SIRIUS_EPSILON_NEW_BACKUP/
rsync -av $sirius_home/Lidar_time_correction /geog/data/arcturus/epsilon/ggwillc/SIRIUS_EPSILON_NEW_BACKUP/
rsync -av $sirius_home/LIDAR_TIME_CORRECTION_TEMP /geog/data/arcturus/epsilon/ggwillc/SIRIUS_EPSILON_NEW_BACKUP/
rsync -av $sirius_home/Maximum_surface_filtering /geog/data/arcturus/epsilon/ggwillc/SIRIUS_EPSILON_NEW_BACKUP/
rsync -av $sirius_home/Median_surface_filtering /geog/data/arcturus/epsilon/ggwillc/SIRIUS_EPSILON_NEW_BACKUP/
rsync -av $sirius_home/OFFSETS_lidar_hyperspec /geog/data/arcturus/epsilon/ggwillc/SIRIUS_EPSILON_NEW_BACKUP/
rsync -av $sirius_home/PCA /geog/data/arcturus/epsilon/ggwillc/SIRIUS_EPSILON_NEW_BACKUP/
rsync -av $sirius_home/vario_outputs /geog/data/arcturus/epsilon/ggwillc/SIRIUS_EPSILON_NEW_BACKUP/

# NOW REMOVE OLD FOLDER - 
