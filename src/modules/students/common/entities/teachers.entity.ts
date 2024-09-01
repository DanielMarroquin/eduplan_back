import { Entity, PrimaryGeneratedColumn, Column, Unique } from 'typeorm';

@Entity('docentes')
@Unique(['email'])
export class Docente {
    @PrimaryGeneratedColumn()
    id: number;

    @Column({ type: 'varchar', length: 255 })
    nombre: string;

    @Column({ type: 'varchar', length: 100 })
    direccion: string;

    @Column({ type: 'varchar', length: 15 })
    telefono: string;

    @Column({ type: 'varchar', length: 50 })
    email: string;

    @Column({ type: 'varchar', length: 255, nullable: true })
    certificaciones?: string;

    @Column({ type: 'varchar', length: 255, nullable: true })
    experiencia?: string;

    @Column({ type: 'varchar', length: 255, nullable: true })
    documentosAdicionales?: string;

    @Column({ type: 'date' })
    fechaContratacion: Date;

    @Column({ type: 'varchar', length: 20 })
    documentoIdentidad: string;
}
