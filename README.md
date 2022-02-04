# Fink2014-model
MATLAB code to simulate the biomechanical model described in [Fink et al. (2014)](https://www.nature.com/articles/nature13276)
#
# Akira Nagamori

## Model Descriptions 
## Reference
Fink AJ, Croce KR, Huang ZJ, Abbott LF, Jessell TM, Azim E. Presynaptic inhibition of spinal sensory feedback ensures smooth movement. Nature. 2014 May 1;509(7498):43-8. doi: 10.1038/nature13276. PMID: 24784215; PMCID: PMC4292914.


# biomechanical_model.m
# Author: Akira Nagamori
# Descriptions: Biomechanical model described in Fink et al. (2014)
```
x = [theta; ... % Joint angle
    theta_dot;... % Angular velocity
    T_e;... Extensor torque
    T_e_dot;... First derivative of extensor torque
    T_f;... Flexor torque
    T_f_dot]; First derivative of flexor torque
u = [I_e;... Input to extensor 
    I_f]; Input to flexor 
# A = state matrix 
# A1 = delay matrix for sensory feedback 
# B = input matrix
