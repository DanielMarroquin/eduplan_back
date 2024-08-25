import {
    Column,
    Entity,
    PrimaryGeneratedColumn,
} from 'typeorm';

@Entity({ name: 'docentes' })
export class DocenteEntity {
    @PrimaryGeneratedColumn()
    id: number;

    @Column({ length: 255 })
    nombre: string;

    @Column({ length: 100 })
    direccion: string;

    @Column({ length: 15 })
    telefono: string;

    @Column({ length: 50, unique: true })
    email: string;

    @Column({ length: 255, nullable: true })
    certificaciones: string;

    @Column({ length: 255, nullable: true })
    experiencia: string;

    @Column({ length: 255, nullable: true })
    documentosAdicionales: string;

    @Column({ type: 'date' })
    fechaContratacion: Date;

    @Column({ length: 20 })
    documentoIdentidad: string;
}
