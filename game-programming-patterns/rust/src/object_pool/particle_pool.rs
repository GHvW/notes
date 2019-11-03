use crate::object_pool::particle::{ Particle };

pub struct ParticlePool {
    // pool_size: f64,
    particles: [Particle; 100]
}

impl ParticlePool {
    pub fn new() -> Self {
        ParticlePool {
            particles: [Particle::new(); 100]
        }
    }

    pub fn create(&mut self, x: f64, y: f64, x_vel: f64, y_vel: f64, lifetime: i64) {
        // let particle_not_in_use = 
        self.particles
            .iter_mut()
            .find(|p| !p.in_use())
            .map_or((), |p| p.init(x, y, x_vel, y_vel, lifetime))

        // match particle_not_in_use {
        //     None => (),
        //     Some(p) => p.init(x, y, x_vel, y_vel, lifetime)
        // }
    }

    pub fn animate(&mut self) {
        self.particles
            .iter_mut()
            .for_each(|p| p.animate())
    }
}