import { Entity, PrimaryGeneratedColumn, Column, ManyToOne } from 'typeorm';
import { Curso } from '../../../courses/common/entities/courses.entity';
import { Docente } from '../../../students/common/entities/teachers.entity';

@Entity('planificaciones')
export class Planificacion {
    @PrimaryGeneratedColumn()
    id: number;

    @ManyToOne(() => Curso, curso => curso.id)
    curso: Curso;

    @Column({ type: 'varchar', length: 255, nullable: true })
    horario?: string;

    @ManyToOne(() => Docente, docente => docente.id)
    docente: Docente;

    @Column({ type: 'varchar', length: 255 })
    detallesPlanificacion: string;

    @Column({ type: 'varchar', length: 100 })
    responsables: string;

    @Column({ type: 'date' })
    fechaPlanificacion: Date;
}
