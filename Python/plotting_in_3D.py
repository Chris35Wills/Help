)

fig = plt.figure()
ax = fig.add_subplot(111, projection='3d', axisbg='none')

x_3d=data['x']
y_3d=data['y']
z_3d=data['norm_elev']

max_range = np.array([x_3d.max()-x_3d.min(), y_3d.max()-y_3d.min(), z_3d.max()-z_3d.min()]).max() / 2.0

mean_x = x_3d.mean()
mean_y = y_3d.mean()
mean_z = z_3d.mean()

ax.set_xlim(mean_x - max_range, mean_x + max_range)
ax.set_ylim(mean_y - max_range, mean_y + max_range)
ax.set_zlim(mean_z - max_range, mean_z + max_range)

parabola_3d=ax.scatter(x_3d,y_3d,z_3d,c=z_3d, s=50,lw=0.0)
ax.set_title("Normal points (fractional polynomial")
ax.view_init(elev=45.)# azim=70)#, azim=ii)

ax.patch.set_alpha(0.0)

fig.colorbar(parabola_3d, shrink=0.5, aspect=5, label='Elevation (m a.s.l.)',orientation="horizontal")

ax.set_zlim(-2000, 2000)

# set figure size - see here: 
# http://codeyarns.com/2014/10/27/how-to-change-size-of-matplotlib-plot/

fig_size = plt.rcParams["figure.figsize"]

fig_size=[None]*2
fig_size[0] = 12
fig_size[1] = 4

plt.rcParams["figure.figsize"] = fig_size

ax.set_xticklabels(" ")
ax.set_yticklabels(" ")
ax.set_zticklabels(" ")

print("Figure size: ", fig_size)
ofig="C:/Users/ggwillc/Documents/GitHub/Bristol_data/Bristol_data/conferences/EGU2016/Poster_materials/Methods/parabola_path2_3d.png"
plt.savefig(ofig, dpi=300, format='png',transparent=True)
plt.close()