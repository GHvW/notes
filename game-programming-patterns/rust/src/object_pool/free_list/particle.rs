
#[derive(Clone, Copy)]
pub struct Particle {
    frames_left: i64,
    x: f64,
    y: f64,
    x_vel: f64,
    y_vel: f64
}

impl Particle {
    pub fn new() -> Self {
        Particle {
            frames_left: 0,
            x: 0.0,
            y: 0.0,
            x_vel: 0.0,
            y_vel: 0.0
        }
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