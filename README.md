# Fink2014-model
MATLAB code to simulate the biomechanical model described in [Fink et al. (2014)](https://www.nature.com/articles/nature13276)
#
# Akira Nagamori
## File
1. biomechanical_model.m
## Model Descriptions
The model is simulated using its state-space representation. Note that the model is dimensionless except for time. All parameters are the same as those in Fink et al., (2014). Feedback gain (h) and delay (t_delay) can be adjusted.  

<img src="https://latex.codecogs.com/svg.image?\bg_white&space;\dot{\textbf{x}}&space;=&space;A\textbf{x}&space;&plus;&space;A_{1}\textbf{x}&space;&plus;&space;B\textbf{u}" title="\bg_white \dot{\textbf{x}} = A\textbf{x} + A_{1}\textbf{x} + B\textbf{u}" />

1. State vector, x = [theta;theta_dot;T_e;T_e_dot;T_f;T_f_dot]
2. Input vector, u = [I_e;I_f]
3. State matrix, A
4. Delay matrix, A1
5. Input matrix, B
 
## Reference
Fink AJ, Croce KR, Huang ZJ, Abbott LF, Jessell TM, Azim E. Presynaptic inhibition of spinal sensory feedback ensures smooth movement. Nature. 2014 May 1;509(7498):43-8. doi: 10.1038/nature13276. PMID: 24784215; PMCID: PMC4292914.
