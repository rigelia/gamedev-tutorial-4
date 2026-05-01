# Tutorial 8 - Game Polishing & Balancing

## Latihan 1

Pergerakan horizontal Player diperbarui agar memakai percepatan dan perlambatan. `speed` diubah menjadi `float`, lalu `velocity.x` digerakkan memakai `lerp()` menuju `speed`, `-speed`, atau `0.0` dengan konstanta `ACCELERATION` dan `DECELERATION` bernilai `400.0`.

## Latihan 2

Scene `Player.tscn` sekarang memiliki `GPUParticles2D` sebagai efek trail lari. Particle memakai `ParticleProcessMaterial`, texture `assets/kenney_platformerpack/PNG/Particles/brickGrey.png`, lifetime `0.5`, gravity y `-100`, spread `180`, initial velocity `50`, dan emission box x `30`. Script Player menyalakan particle saat player berada di lantai dan horizontal velocity sudah mendekati kecepatan maksimum.

Menurut saya, movement baru dan trail particle membuat kontrol terasa lebih halus karena player tidak langsung berhenti atau bergerak secara instan. Particle juga memberi _visual feedback_ bahwa karakter sudah mencapai kecepatan lari maksimum.

## Latihan 3

Spawner dibuat memiliki variabel `spawn_rate` dan nilainya disetel default ke `3.0` detik. Nilai ini lebih longgar daripada 1 detik yang terlalu agresif, tetapi masih lebih menantang daripada 5 detik karena pemain tetap perlu menunggu timing lompatan yang tepat.
