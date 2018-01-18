#!/bin/bash

##### SETTINGS #####

ENERGY_MIN=1000
ENERGY_MAX=5000
ENERGY_STEP=1000

MA_MIN=900
MA_MAX=1100
MA_STEP=100

C5A_MIN=1.1
C5A_MAX=1.3
C5A_STEP=0.1

OUTDIR="res/"
mkdir -p $OUTDIR

##### SIMULATIONS ######

for energy in $(seq $ENERGY_MIN $ENERGY_STEP $ENERGY_MAX)
do
    for ma in $(seq $MA_MIN $MA_STEP $MA_MAX)
    do
        ../../../bin/nuwro -i "parres.txt" \
            -p "beam_particle = 14" \
            -p "beam_energy = $energy" \
            -p "pion_axial_mass = $ma" \
            -p "pion_C5A = 1.1" \
            -p "dyn_qel_cc = 1" \
            -p "dyn_qel_nc = 0" \
            -o "${OUTDIR}/numu${energy}_cc_ma${ma}_c5a11.root" &

        ../../../bin/nuwro -i "parres.txt" \
            -p "beam_particle = 14" \
            -p "beam_energy = $energy" \
            -p "pion_axial_mass = $ma" \
            -p "pion_C5A = 1.1" \
            -p "dyn_qel_cc = 0" \
            -p "dyn_qel_nc = 1" \
            -o "${OUTDIR}/numu${energy}_nc_ma${ma}_c5a11.root" &

        ../../../bin/nuwro -i "parres.txt" \
            -p "beam_particle = -14" \
            -p "beam_energy = $energy" \
            -p "pion_axial_mass = $ma" \
            -p "pion_C5A = 1.1" \
            -p "dyn_qel_cc = 1" \
            -p "dyn_qel_nc = 0" \
            -o "${OUTDIR}/numubar${energy}_cc_ma${ma}_c5a11.root" &

        ../../../bin/nuwro -i "parres.txt" \
            -p "beam_particle = 14" \
            -p "beam_energy = $energy" \
            -p "pion_axial_mass = $ma" \
            -p "pion_C5A = 1.1" \
            -p "dyn_qel_cc = 0" \
            -p "dyn_qel_nc = 1" \
            -o "${OUTDIR}/numubar${energy}_nc_ma${ma}_c5a11.root" &

        ../../../bin/nuwro -i "parres.txt" \
            -p "beam_particle = 14" \
            -p "beam_energy = $energy" \
            -p "pion_axial_mass = $ma" \
            -p "pion_C5A = 1.2" \
            -p "dyn_qel_cc = 1" \
            -p "dyn_qel_nc = 0" \
            -o "${OUTDIR}/numu${energy}_cc_ma${ma}_c5a12.root" &

        ../../../bin/nuwro -i "parres.txt" \
            -p "beam_particle = 14" \
            -p "beam_energy = $energy" \
            -p "pion_axial_mass = $ma" \
            -p "pion_C5A = 1.2" \
            -p "dyn_qel_cc = 0" \
            -p "dyn_qel_nc = 1" \
            -o "${OUTDIR}/numu${energy}_nc_ma${ma}_c5a12.root" &

        ../../../bin/nuwro -i "parres.txt" \
            -p "beam_particle = -14" \
            -p "beam_energy = $energy" \
            -p "pion_axial_mass = $ma" \
            -p "pion_C5A = 1.2" \
            -p "dyn_qel_cc = 1" \
            -p "dyn_qel_nc = 0" \
            -o "${OUTDIR}/numubar${energy}_cc_ma${ma}_c5a12.root" &

        ../../../bin/nuwro -i "parres.txt" \
            -p "beam_particle = 14" \
            -p "beam_energy = $energy" \
            -p "pion_axial_mass = $ma" \
            -p "pion_C5A = 1.2" \
            -p "dyn_qel_cc = 0" \
            -p "dyn_qel_nc = 1" \
            -o "${OUTDIR}/numubar${energy}_nc_ma${ma}_c5a12.root" &

        ../../../bin/nuwro -i "parres.txt" \
            -p "beam_particle = 14" \
            -p "beam_energy = $energy" \
            -p "pion_axial_mass = $ma" \
            -p "pion_C5A = 1.3" \
            -p "dyn_qel_cc = 1" \
            -p "dyn_qel_nc = 0" \
            -o "${OUTDIR}/numu${energy}_cc_ma${ma}_c5a13.root" &

        ../../../bin/nuwro -i "parres.txt" \
            -p "beam_particle = 14" \
            -p "beam_energy = $energy" \
            -p "pion_axial_mass = $ma" \
            -p "pion_C5A = 1.3" \
            -p "dyn_qel_cc = 0" \
            -p "dyn_qel_nc = 1" \
            -o "${OUTDIR}/numu${energy}_nc_ma${ma}_c5a13.root" &

        ../../../bin/nuwro -i "parres.txt" \
            -p "beam_particle = -14" \
            -p "beam_energy = $energy" \
            -p "pion_axial_mass = $ma" \
            -p "pion_C5A = 1.3" \
            -p "dyn_qel_cc = 1" \
            -p "dyn_qel_nc = 0" \
            -o "${OUTDIR}/numubar${energy}_cc_ma${ma}_c5a13.root" &

        ../../../bin/nuwro -i "parres.txt" \
            -p "beam_particle = 14" \
            -p "beam_energy = $energy" \
            -p "pion_axial_mass = $ma" \
            -p "pion_C5A = 1.3" \
            -p "dyn_qel_cc = 0" \
            -p "dyn_qel_nc = 1" \
            -o "${OUTDIR}/numubar${energy}_nc_ma${ma}_c5a13.root"
    done
done

##### REWEIGHTING AXIAL MASS #####

for energy in $(seq $ENERGY_MIN $ENERGY_STEP $ENERGY_MAX)
do
    for ma in $(seq $MA_MIN $MA_STEP $MA_MAX)
    do
        ../../../bin/reweight_to \
            "${OUTDIR}/numu${energy}_cc_ma1000_c5a11.root" \
            -o "${OUTDIR}/numu${energy}_cc_rewto_ma${ma}_c5a11.root" \
            -p pion_axial_mass $ma &

        ../../../bin/reweight_to \
            "${OUTDIR}/numu${energy}_nc_ma1000_c5a11.root" \
            -o "${OUTDIR}/numu${energy}_nc_rewto_ma${ma}_c5a11.root" \
            -p pion_axial_mass $ma &

        ../../../bin/reweight_to \
            "${OUTDIR}/numubar${energy}_cc_ma1000_c5a11.root" \
            -o "${OUTDIR}/numubar${energy}_cc_rewto_ma${ma}_c5a11.root" \
            -p pion_axial_mass $ma &

        ../../../bin/reweight_to \
            "${OUTDIR}/numubar${energy}_nc_ma1000_c5a11.root" \
            -o "${OUTDIR}/numubar${energy}_nc_rewto_ma${ma}_c5a11.root" \
            -p pion_axial_mass $ma &

        ../../../bin/reweight_to \
            "${OUTDIR}/numu${energy}_cc_ma1000_c5a12.root" \
            -o "${OUTDIR}/numu${energy}_cc_rewto_ma${ma}_c5a12.root" \
            -p pion_axial_mass $ma &

        ../../../bin/reweight_to \
            "${OUTDIR}/numu${energy}_nc_ma1000_c5a12.root" \
            -o "${OUTDIR}/numu${energy}_nc_rewto_ma${ma}_c5a12.root" \
            -p pion_axial_mass $ma &

        ../../../bin/reweight_to \
            "${OUTDIR}/numubar${energy}_cc_ma1000_c5a12.root" \
            -o "${OUTDIR}/numubar${energy}_cc_rewto_ma${ma}_c5a12.root" \
            -p pion_axial_mass $ma &

        ../../../bin/reweight_to \
            "${OUTDIR}/numubar${energy}_nc_ma1000_c5a12.root" \
            -o "${OUTDIR}/numubar${energy}_nc_rewto_ma${ma}_c5a12.root" \
            -p pion_axial_mass $ma &

        ../../../bin/reweight_to \
            "${OUTDIR}/numu${energy}_cc_ma1000_c5a13.root" \
            -o "${OUTDIR}/numu${energy}_cc_rewto_ma${ma}_c5a13.root" \
            -p pion_axial_mass $ma &

        ../../../bin/reweight_to \
            "${OUTDIR}/numu${energy}_nc_ma1000_c5a13.root" \
            -o "${OUTDIR}/numu${energy}_nc_rewto_ma${ma}_c5a13.root" \
            -p pion_axial_mass $ma &

        ../../../bin/reweight_to \
            "${OUTDIR}/numubar${energy}_cc_ma1000_c5a13.root" \
            -o "${OUTDIR}/numubar${energy}_cc_rewto_ma${ma}_c5a13.root" \
            -p pion_axial_mass $ma &

        ../../../bin/reweight_to \
            "${OUTDIR}/numubar${energy}_nc_ma1000_c5a13.root" \
            -o "${OUTDIR}/numubar${energy}_nc_rewto_ma${ma}_c5a13.root" \
            -p pion_axial_mass $ma
    done
done

##### REWEIGHTING PION C5A #####

for energy in $(seq $ENERGY_MIN $ENERGY_STEP $ENERGY_MAX)
do
    for ma in $(seq $MA_MIN $MA_STEP $MA_MAX)
    do
        ../../../bin/reweight_to \
            "${OUTDIR}/numu${energy}_cc_ma${ma}_c5a12.root" \
            -o "${OUTDIR}/numu${energy}_cc_rewto_ma${ma}_c5a12.root" \
            -p pion_C5A 1.2 &

        ../../../bin/reweight_to \
            "${OUTDIR}/numu${energy}_nc_ma${ma}_c5a12.root" \
            -o "${OUTDIR}/numu${energy}_nc_rewto_ma${ma}_c5a12.root" \
            -p pion_C5A 1.2 &

        ../../../bin/reweight_to \
            "${OUTDIR}/numubar${energy}_cc_ma${ma}_c5a12.root" \
            -o "${OUTDIR}/numubar${energy}_cc_rewto_ma${ma}_c5a12.root" \
            -p pion_C5A 1.2 &

        ../../../bin/reweight_to \
            "${OUTDIR}/numubar${energy}_nc_ma${ma}_c5a12.root" \
            -o "${OUTDIR}/numubar${energy}_nc_rewto_ma${ma}_c5a12.root" \
            -p pion_C5A 1.2 &

        ../../../bin/reweight_to \
            "${OUTDIR}/numu${energy}_cc_ma${ma}_c5a12.root" \
            -o "${OUTDIR}/numu${energy}_cc_rewto_ma${ma}_c5a11.root" \
            -p pion_C5A 1.1 &

        ../../../bin/reweight_to \
            "${OUTDIR}/numu${energy}_nc_ma${ma}_c5a12.root" \
            -o "${OUTDIR}/numu${energy}_nc_rewto_ma${ma}_c5a11.root" \
            -p pion_C5A 1.1 &

        ../../../bin/reweight_to \
            "${OUTDIR}/numubar${energy}_cc_ma${ma}_c5a12.root" \
            -o "${OUTDIR}/numubar${energy}_cc_rewto_ma${ma}_c5a11.root" \
            -p pion_C5A 1.1 &

        ../../../bin/reweight_to \
            "${OUTDIR}/numubar${energy}_nc_ma${ma}_c5a12.root" \
            -o "${OUTDIR}/numubar${energy}_nc_rewto_ma${ma}_c5a11.root" \
            -p pion_C5A 1.1 &

        ../../../bin/reweight_to \
            "${OUTDIR}/numu${energy}_cc_ma${ma}_c5a12.root" \
            -o "${OUTDIR}/numu${energy}_cc_rewto_ma${ma}_c5a13.root" \
            -p pion_C5A 1.3 &

        ../../../bin/reweight_to \
            "${OUTDIR}/numu${energy}_nc_ma${ma}_c5a12.root" \
            -o "${OUTDIR}/numu${energy}_nc_rewto_ma${ma}_c5a13.root" \
            -p pion_C5A 1.3 &

        ../../../bin/reweight_to \
            "${OUTDIR}/numubar${energy}_cc_ma${ma}_c5a12.root" \
            -o "${OUTDIR}/numubar${energy}_cc_rewto_ma${ma}_c5a13.root" \
            -p pion_C5A 1.3 &

        ../../../bin/reweight_to \
            "${OUTDIR}/numubar${energy}_nc_ma${ma}_c5a12.root" \
            -o "${OUTDIR}/numubar${energy}_nc_rewto_ma${ma}_c5a13.root" \
            -p pion_C5A 1.3
    done
done

###### RUN MACRO ######