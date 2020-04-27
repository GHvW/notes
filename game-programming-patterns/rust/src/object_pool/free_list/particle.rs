struct ParticleState {
    x: f64,
    y: f64,
    x_vel: f64,
    y_vel: f64
}

enum FreeParticle {
    Live(ParticleState),
    Link(Option<Box<Particle>>)
}

pub struct Particle {
    frames_left: i64,
    state: FreeParticle
}

impl Particle {
    pub fn new() -> Self {
        Particle {
            frames_left: 0,
            state: FreeParticle::Link(None)
        }
    }

    pub fn next(&self) -> Box<Particle> {
        self.state.next
    }

    pub fn init(&mut self, x: f64, y: f64, x_vel: f64, y_vel: f64, lifetime: i64) {
        self.x = x;
        self.y = y;
        self.x_vel = x_vel; 
        self.y_vel = y_vel; 
        self.frames_left = lifetime;
    }

    pub fn animate(&mut self) {
        if !self.in_use() { 
            () 
        } else {
            self.frames_left = self.frames_left - 1;
            self.x = self.x + self.x_vel;
            self.y = self.y + self.y_vel;
        }
    }

    pub fn in_use(&self) -> bool {
        self.frames_left > 0
    }
}