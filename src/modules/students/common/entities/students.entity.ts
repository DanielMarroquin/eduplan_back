import { Entity, PrimaryGeneratedColumn, Column, ManyToOne } from 'typeorm';
import { Empresa } from './company.entity';

@Entity('alumnos')
export class Alumno {
    @PrimaryGeneratedColumn()
    id: number;

    @Column({ type: 'varchar', length: 50 })
    primerNombre: string;

    @Column({ type: 'varchar', length: 50, nullable: true })
    segundoNombre?: string;

    @Column({ type: 'varchar', length: 50 })
    primerApellido: string;

    @Column({ type: 'varchar', length: 50, nullable: true })
    segundoApellido?: string;

    @Column({ type: 'varchar', length: 255 })
    nombre: string;

    @Column({ type: 'varchar', length: 100 })
    direccion: string;

    @Column({ type: 'varchar', length: 15 })
    telefono: string;

    @Column({ type: 'varchar', length: 50, unique: true })
    email: string;

    @Column({ type: 'varchar', length: 255, nullable: true })
    informacionAcademica?: string;

    @Column({ type: 'varchar', length: 255, nullable: true })
    tipoDocumento?: string;

    @Column({ type: 'varchar', length: 20 })
    documentoIdentidad: string;

    @Column({ type: 'date' })
    fechaInscripcion: Date;

    @Column({ type: 'date' })
    fechaNacimiento: Date;

    @ManyToOne(() => Empresa, empresa => empresa.alumnos)
    empresa: Empresa;

    @Column({ type: 'int', default: 1 })  // Agregado el campo status
    status: number;
}
