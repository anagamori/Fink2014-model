# Fink2014-model
MATLAB code to simulate the biomechanical model described in [Fink et al. (2014)](https://www.nature.com/articles/nature13276)
#
# Akira Nagamori
## File
1. biomechanical_model.m
## Model Descriptions
The model is simulated using its state-space representation. 
<img src="https://latex.codecogs.com/svg.image?\bg_white&space;\dot{\textbf{x}}&space;=&space;A\textbf{x}&space;&plus;&space;A_{1}\textbf{x}&space;&plus;&space;B\textbf{u}" title="\bg_white \dot{\textbf{x}} = A\textbf{x} + A_{1}\textbf{x} + B\textbf{u}" />
- State vector, x
- Input vector, u
- State matrix, A
- Delay matrix, A1
- Input matrix, B


```
x = [theta; ... % Joint angle
    theta_dot;... % Angular velocity
    T_e;... Extensor torque
    T_e_dot;... First derivative of extensor torque
    T_f;... Flexor torque
    T_f_dot]; First derivative of flexor torque
```
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
