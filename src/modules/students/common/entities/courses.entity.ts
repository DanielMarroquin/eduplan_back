import { Entity, PrimaryGeneratedColumn, Column } from 'typeorm';

@Entity('cursos')
export class Curso {
    @PrimaryGeneratedColumn()
    id: number;

    @Column({ length: 255 })
    nombre: string;

    @Column({ length: 255, nullable: true })
    descripcion?: string;

    @Column({ length: 255, nullable: true })
    duracion?: string;

    @Column({ length: 255 })
    objetivos: string;

    @Column({ length: 100 })
    responsables: string;

    @Column()
    fechaInicio: Date;

    @Column()
    fechaFin: Date;
}
