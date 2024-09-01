import { Entity, PrimaryGeneratedColumn, Column, ManyToOne } from 'typeorm';
import { Alumno } from '../../../students/common/entities/students.entity';
import { Curso } from '../../../courses/common/entities/courses.entity';
import { Planificacion } from './planiification.entity';

@Entity('evaluaciones')
export class Evaluacion {
    @PrimaryGeneratedColumn()
    id: number;

    @ManyToOne(() => Alumno, alumno => alumno.id)
    alumno: Alumno;

    @ManyToOne(() => Curso, curso => curso.id)
    curso: Curso;

    @Column({ type: 'varchar', length: 255, nullable: true })
    calificacion?: string;

    @Column({ type: 'varchar', length: 255, nullable: true })
    retroalimentacion?: string;

    @Column({ type: 'varchar', length: 255 })
    criteriosEvaluacion: string;

    @Column({ type: 'varchar', length: 100 })
    responsables: string;

    @Column({ type: 'date' })
    fechaEvaluacion: Date;

    @ManyToOne(() => Planificacion, planificacion => planificacion.id, { onDelete: 'RESTRICT', onUpdate: 'RESTRICT' })
    planificacion?: Planificacion;
}
