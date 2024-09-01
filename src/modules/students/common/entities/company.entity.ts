import { Entity, PrimaryGeneratedColumn, Column } from 'typeorm';

@Entity('empresas')
export class Empresa {
    @PrimaryGeneratedColumn()
    id: number;

    @Column({ type: 'varchar', length: 255 })
    nombre: string;

    @Column({ type: 'varchar', length: 255, nullable: true })
    descripcion?: string;

    @Column({ type: 'varchar', length: 255, nullable: true })
    sector?: string;

    @Column({ type: 'date' })
    fechaFundacion: Date;

    @Column({ type: 'varchar', length: 100, nullable: true })
    direccion?: string;

    @Column({ type: 'varchar', length: 15, nullable: true })
    telefono?: string;

    @Column({ type: 'varchar', length: 50, nullable: true, unique: true })
    email?: string;
    alumnos: any;
}
